//
//  WMProductsListVC.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/20.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMProductsListVC.h"
#import "WMProductsListCell.h"
#import "WMROOTViewController.h"
#import "WMProductsListHeadView.h"
#import "CYloginRegisterViewController.h"
#import "ProductModel.h"
#import <BlocksKit+UIKit.h>
#import "GzwHUDTool.h"
#import "GZWTool.h"
static NSString *cellIdentifier = @"WMProductsListCellcellIdentifier";
static NSString *cellHeaderViewIdentifier = @"WMProductsListHeadViewIdentifier";

@interface WMProductsListVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) UIButton *goBackButton;
@property (nonatomic , strong) NSMutableArray *arrayData;
@property (nonatomic, strong) NSArray *eachSectionLeastSelect;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *bottomButton;
@property (nonatomic, strong) UIView *chooseButtons;
@property (nonatomic) NSUInteger numberOfPay;
@end

@implementation WMProductsListVC


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.headerReferenceSize = CGSizeMake(Width, 20);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMProductsListCell class]) bundle:nil] forCellWithReuseIdentifier:cellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WMProductsListHeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellHeaderViewIdentifier];
    }
    return _collectionView;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    //清空所有数据
    [self clearSelect];
    [self calTicketNumber];
    [self.bottomButton setTitle:@"快速机选" forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayData = [NSMutableArray arrayWithCapacity:0];
    self.numberOfPay = 0;
    self.view.backgroundColor = [OTSColor colorWithRGB:0xeeeeee];
    [self.view addSubview:self.collectionView];
    self.collectionView.frame =CGRectMake(0,64,Width,Height-64-40);
    
    [self addButtomView];
    // Do any additional setup after loading the view.
    [self loadData];
}

- (void)addButtomView {
    UIView *bottomView = [[UIView alloc]init];
    bottomView.frame = CGRectMake(0,Height - 40,Width,40);
    bottomView.backgroundColor = [OTSColor whiteColor];
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
    
    UIView *line = [[UIView alloc]init];
    line.frame = CGRectMake(0, 0, Width, 1);
    line.backgroundColor = [UIColor lightTextColor];
    [bottomView addSubview:line];
    
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomButton.frame = CGRectMake(8, 5, 60, 30);
    [bottomButton setTitle:@"快速机选" forState:UIControlStateNormal];
    [bottomButton setTitleColor:[OTSColor paleRedColor] forState:UIControlStateNormal];
    bottomButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    __weak WMProductsListVC* weakSelf = self;
    [bottomButton bk_addEventHandler:^(id sender) {
        UIButton *button = (UIButton *)sender;
        if ([button.titleLabel.text isEqualToString:@"快速机选"]) {
//            //更换右边视图 选择机选注数 更换标标题为取消机选
//            [button setTitle:@"取消机选" forState:UIControlStateNormal];
//            [weakSelf.infoLabel removeFromSuperview];
//            [weakSelf.sureButton removeFromSuperview];
//            [weakSelf.bottomView addSubview:weakSelf.chooseButtons];
        } else if ([button.titleLabel.text isEqualToString:@"取消机选"]) {
            //更换右边视图 更换标题位快速机选
            [button setTitle:@"快速机选" forState:UIControlStateNormal];
            [weakSelf.chooseButtons removeFromSuperview];
            [weakSelf.bottomView addSubview:weakSelf.infoLabel];
            [weakSelf.bottomView addSubview:weakSelf.sureButton];
        } else if ([button.titleLabel.text isEqualToString:@"清空所选"]) {
            //更换标题为为快速机选, 清空选择
            [button setTitle:@"快速机选" forState:UIControlStateNormal];
            [self clearSelect];
            [self calTicketNumber];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:bottomButton];
    self.bottomButton = bottomButton;
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(Width - 60, 0, 60, 40);
    sureButton.backgroundColor = [UIColor redColor];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [sureButton bk_addEventHandler:^(id sender) {
        //没有选号 自动机选
        if (self.numberOfPay == 0) {
            //随机选一组数
            NSArray *randomArray = [self randomTicket];
            
            for (NSUInteger i = 0; i < randomArray.count; i++) {
                for (NSUInteger j = 0; j < [randomArray[i] count]; j ++) {
                    ProductModel *model = self.arrayData[i];
                    NumberModel *number = model.numbers[[randomArray[i][j] integerValue]];
                    number.isSelect = true;
                }
            }
            
            [self.collectionView reloadData];
            [self calTicketNumber];
        } else {// 选择完成
            NSNumber *n = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
            if (n.boolValue) {
                [GzwHUDTool showWithStatus:nil];
                [NSObject gzw_performAfter:2 block:^{
                    [GzwHUDTool showSuccessWithStatus:@"预购买成功"];
                }];
            }else {
                CYloginRegisterViewController *loginRegister = [[CYloginRegisterViewController alloc] init];
                [self presentViewController:loginRegister animated:YES completion:nil];
            }
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:sureButton];
    self.sureButton = sureButton;
    
    UILabel *infoLabel = [[UILabel alloc]init];
    self.infoLabel = infoLabel;
    
    [self calLabel:@"手机摇一摇,快速来一注"];
    
    [bottomView addSubview:infoLabel];
    
    UIView *chooseView = [[UIView alloc]init];
    chooseView.frame = CGRectMake(60 + 16, 0, Width - 60 - 16, 40);
    chooseView.backgroundColor = [UIColor whiteColor];
    CGFloat buttonHeight = 30;
    CGFloat buttonWidth = (Width - 60 - 50 - 16) / 5;
    for (int i = 0; i < 5; i++) {
        UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [chooseButton setTitle:[NSString stringWithFormat:@"%d注",i] forState:UIControlStateNormal];
        [chooseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        chooseButton.titleLabel.font = [UIFont systemFontOfSize:12];
        chooseButton.frame = CGRectMake((buttonWidth + 10) * i, 5, buttonWidth, buttonHeight);
        chooseButton.layer.borderWidth = 1;
        chooseButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [chooseView addSubview:chooseButton];
        [chooseButton bk_addEventHandler:^(id sender) {
            //机选 i + 1注
            NSMutableArray * machineSelectArray = [NSMutableArray arrayWithCapacity:0];
            for (int j = 0; j < i + 1;j ++) {
                [machineSelectArray addObject:[self randomTicket]];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    self.chooseButtons = chooseView;
}

- (void)calLabel:(NSString *)str {
    _infoLabel.text = str;//[NSString stringWithFormat:@"已选%li注%li元",self.numberOfPay,self.numberOfPay * 2];
    _infoLabel.font = [UIFont systemFontOfSize:12];
    [_infoLabel sizeToFit];
    CGRect frame = _infoLabel.frame;
    frame.origin = CGPointMake((Width - frame.size.width) / 2, (40 - frame.size.height) / 2);
    //NSLog(@"%@",NSStringFromCGRect(frame));
    _infoLabel.frame = frame;
}

- (void)loadData {
    if ([self.fileName isEqualToString:@"DaLeTou"]) {
        self.eachSectionLeastSelect = @[@5,@2];
    } else if ([self.fileName isEqualToString:@"ShuangSeQiu"]) {
        self.eachSectionLeastSelect = @[@6,@1];
    } else if ([self.fileName isEqualToString:@"FuCai3D"]) {
        self.eachSectionLeastSelect = @[@1,@1,@1];
    } else if ([self.fileName isEqualToString:@"QiLeCai"]) {
        self.eachSectionLeastSelect = @[@7];
    } else if ([self.fileName isEqualToString:@"SevenStarData"]) {
        self.eachSectionLeastSelect = @[@1,@1,@1,@1,@1,@1,@1];
    } else if ([self.fileName isEqualToString:@"PaiLieSan"]) {
        self.eachSectionLeastSelect = @[@1,@1,@1];
    } else if ([self.fileName isEqualToString:@"PaiLieWu"]) {
        self.eachSectionLeastSelect = @[@1,@1,@1,@1,@1];
    } else {
        self.eachSectionLeastSelect = @[@2];
    }
    NSArray *dataArray = [NSMutableArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:self.fileName withExtension:@"plist"]];
    [dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ProductModel * model = [[ProductModel alloc] initWithDictionary:obj error:nil];
        [self.arrayData addObject:model];
    }];
    [_collectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.arrayData count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    ProductModel *model = self.arrayData[section];
    NSArray *sectionData = model.numbers;
    return sectionData.count;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(40,40);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WMProductsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    ProductModel *model = self.arrayData[indexPath.section];
    [cell setStatus:model.numbers[indexPath.row]];
    return cell;
}
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        WMProductsListHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellHeaderViewIdentifier forIndexPath:indexPath];
        ProductModel *model = self.arrayData[indexPath.section];
        headerView.titleLabel.text = model.title;
        reusableview = headerView;
    }
    
    return reusableview;
}

- (void)daLeTouSelect:(NSIndexPath *) indexPath {
    
}

- (void)shuangSeQiuSelect:(NSIndexPath *) indexPath {
    
}

- (void)qiLeCaiSelect:(NSIndexPath *) indexPath {
    
}

- (void)gaoPinCai:(NSIndexPath *) indexPath {
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.bottomButton.isSelected) {
        //清空选择
        //取消按钮选中
        //还原底部视图
    } else {
        ProductModel *model = self.arrayData[indexPath.section];
        NumberModel *number = model.numbers[indexPath.row];
        number.isSelect = !number.isSelect;
        
        
        [self calTicketNumber];
        
        [collectionView reloadData];
    }
}




- (int)fact:(int) n {
    int pro;
    if (n <= 1) {
        pro = 1;
    } else {
        pro = n * [self fact:n -1];
    }
    return pro;
}

- (int)comb:(int)n number:(int)m {
    return [self fact:n] / ([self fact:m] * [self fact:n - m]);
}

- (void)goBackButtonClick{
    NSLog(@"back");
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)canBecomeFirstResponder {
    return true;
}

//计算注数
- (void)calTicketNumber {
    NSMutableArray* selectedNumbers = [NSMutableArray arrayWithCapacity:0];
    [self.arrayData enumerateObjectsUsingBlock:^(ProductModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        __block NSInteger count = 0;
        [obj.numbers enumerateObjectsUsingBlock:^(NumberModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                count += 1;
            }
        }];
        [selectedNumbers addObject:[NSNumber numberWithInteger:count]];
    }];
    
    NSUInteger numberOfPay = 0;
    for (NSUInteger i = 0; i < self.eachSectionLeastSelect.count; i++) {
        int selectedNumber = [selectedNumbers[i] intValue];
        int selectNumber = [self.eachSectionLeastSelect[i] intValue];
        if (selectedNumber < selectNumber) {
            numberOfPay = 0;
            break;
        } else {
            if (numberOfPay == 0) {
                numberOfPay = [self comb:selectedNumber number:selectNumber];
            } else {
                numberOfPay = [self comb:selectedNumber number:selectNumber] * numberOfPay;
            }
        }
    }
    
    if (numberOfPay != 0) {
        self.numberOfPay = numberOfPay;
        [self calLabel:[NSString stringWithFormat:@"已选%li注%li元",self.numberOfPay,self.numberOfPay * 2]];
        [self.bottomButton setTitle:@"清空所选" forState:UIControlStateNormal];
        
    } else {
        if (self.numberOfPay != 0) {
            self.numberOfPay = 0;
            [self calLabel:@"手机摇一摇,快速来一注"];
        }
        
    }
}

//清除所有已选
- (void) clearSelect {
    [self.arrayData enumerateObjectsUsingBlock:^(ProductModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.numbers enumerateObjectsUsingBlock:^(NumberModel*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.isSelect) {
                obj.isSelect = false;
            }
        }];
    }];
    [self.collectionView reloadData];
}

- (NSArray *)randomTicket {
    NSMutableArray *randomSelect = [NSMutableArray arrayWithCapacity:0];
    
    
    for (NSUInteger i = 0; i < self.eachSectionLeastSelect.count; i++) {
        [randomSelect addObject:[NSMutableArray arrayWithCapacity:0]];
    }
    
    
    for (NSUInteger j = 0; j < self.eachSectionLeastSelect.count; j++) {
        NSUInteger index = 0;
        while ([randomSelect[j] count] < [self.eachSectionLeastSelect[j] integerValue]) {
            NSInteger random = arc4random() % [[self.arrayData[j] numbers] count];
           // static NSUInteger index = 0;
            if (index == 0) {
                [randomSelect[j] addObject:[NSNumber numberWithInteger:random]];
                
                //ProductModel *model = self.arrayData[j];
                //NumberModel *number = model.numbers[random];
                //number.isSelect = true;
                index++;
            } else {
                if (![randomSelect[j] containsObject:[NSNumber numberWithInteger:random]]) {
                    [randomSelect[j] addObject:[NSNumber numberWithInteger:random]];
                    index++;
                }
            }
        }
        
        
    }
    //NSLog(@"%@",randomSelect);
    return randomSelect;
}

//摇动机选一注
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        //清除所有已选
        [self clearSelect];
        //随机选一组数
        NSArray *randomArray = [self randomTicket];
        
        for (NSUInteger i = 0; i < randomArray.count; i++) {
            for (NSUInteger j = 0; j < [randomArray[i] count]; j ++) {
                ProductModel *model = self.arrayData[i];
                NumberModel *number = model.numbers[[randomArray[i][j] integerValue]];
                number.isSelect = true;
            }
        }
        
        [self.collectionView reloadData];
        [self calTicketNumber];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
