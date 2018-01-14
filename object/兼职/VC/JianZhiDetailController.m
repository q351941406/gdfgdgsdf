//
//  JianZhiDetailController.m
//  JianGuo
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 ningcol. All rights reserved.
//
#define USERDEFAULTS [NSUserDefaults standardUserDefaults]

#import "JianZhiDetailController.h"
#import "DetailsCell.h"
#import "DetailHeaderCell.h"
#import "WorkDetailCell.h"
#import "DetailModel.h"
#import "JianzhiModel.h"
#import "Masonry.h"
#import "MQChatViewManager.h"
#import "GZWTool.h"
#import "GzwHUDTool.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "GzwThemeTool.h"
#import "CYloginRegisterViewController.h"
#define KRGB(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
@interface JianZhiDetailController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,clickMoreBtnDelegate>
{
    UIButton *signUpBtn;
    UIButton *chatBtn;
    BOOL _isMore;
}
@property (nonatomic,strong) UIImageView *noNetView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) DetailModel *detailModel;
@property (nonatomic,strong) UIImageView *collectionView;
@property (nonatomic,strong) UILabel *moneyL;
@property (nonatomic,strong) UILabel *dateL;
@property (nonatomic,strong) UILabel *addressL;
@property (nonatomic,strong) NSMutableArray *welfareArr;

@end

@implementation JianZhiDetailController

-(NSMutableArray *)welfareArr
{
    if (!_welfareArr) {
        _welfareArr = [NSMutableArray array];
    }
    return _welfareArr;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ViewW, viewH-44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
      //  self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"upBack" highImage:@"upBack"];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshCellHeight:) name:@"contentSizeChanged" object:nil];
    
    self.title = @"兼职详情";
    
    [self.view addSubview:self.tableView];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension; // 自适应单元格高度
    self.tableView.estimatedRowHeight = 150; //先估计一个高度
    
    [self configBottomBar];
    
  
    [self configNoNetView];

    [GzwHUDTool showWithStatus:@"正在加载..."];
    
    NSString *url = [NSString stringWithFormat:@"http://101.200.195.147:9090/job/user/detail/%@",self.jobId];
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    mar.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型

    [mar GET:url parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable response) {
        [GzwHUDTool dismiss];
        self.detailModel = [DetailModel mj_objectWithKeyValues:[response objectForKey:@"data"]];
        
        if (self.detailModel.isFavorite.intValue == 1) {
            self.collectionView.image = [UIImage imageNamed:@"icon_yipingjia"];
        };
        if (self.detailModel.join_status.intValue == 1) {
            signUpBtn.backgroundColor = [UIColor lightGrayColor];
            [signUpBtn setTitle:@"已报名" forState:UIControlStateNormal];
            signUpBtn.userInteractionEnabled = NO;
        }
        
        self.welfareArr = [NSMutableArray arrayWithArray:[response[@"data"] objectForKey:@"welfare_name"]];
        
        
        [self.tableView reloadData];
        if (!self.detailModel) {
            self.noNetView.hidden = NO;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        [GzwHUDTool dismiss];
    }];
    
    
    
    
    
//    NSString *url = [NSString stringWithFormat:@"http://101.200.195.147:9090/job/user/detail/%@",self.jobId];
//    WeakSelf;
//    [FHNetworkTool POSTWithParameters:nil url:url success:^(id response) {
//        [SYProgressHUD hide];
//
//            weakSelf.detailModel = [DetailModel mj_objectWithKeyValues:[response objectForKey:@"data"]];
//
//            if (weakSelf.detailModel.isFavorite.intValue == 1) {
//                weakSelf.collectionView.image = [UIImage imageNamed:@"icon_yipingjia"];
//            };
//            if (weakSelf.detailModel.join_status.intValue == 1) {
//                signUpBtn.backgroundColor = [UIColor lightGrayColor];
//                [signUpBtn setTitle:@"已报名" forState:UIControlStateNormal];
//                signUpBtn.userInteractionEnabled = NO;
//            }
//
//            self.welfareArr = [NSMutableArray arrayWithArray:[response[@"data"] objectForKey:@"welfare_name"]];
//
//
//            [weakSelf.tableView reloadData];
//            if (!self.detailModel) {
//                self.noNetView.hidden = NO;
//            }
//
//
//    } failure:^(NSError *error) {
//        [SYProgressHUD showToBottomText:@"服务器异常"];
//    }];
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  没加载出数据时的图片
 */
-(void)configNoNetView
{
//    CGFloat top;
//    if (IS_IPHONE5) {
//        top = 120;
//    }else if (IS_IPHONE6){
//        top = 150;
//    }else if (IS_IPHONE6PLUS){
//        top = 200;
//    }
//    self.noNetView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_W-198*(SCREEN_W/414))/2, top, 198*(SCREEN_W/414), 228*(SCREEN_W/414))];
//    self.noNetView.image = [UIImage imageNamed:@"netnull"];
//    [self.tableView addSubview:self.noNetView];
//    self.noNetView.hidden = YES;
}




/**
 *  刷新cell高度
 */
-(void)refreshCellHeight:(NSNotification *)noti
{
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:3]] withRowAnimation:UITableViewRowAnimationNone];
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 90;
    }else if (indexPath.section == 1){
        return 242;
    }else if (indexPath.section == 2){
        if (_isMore == NO) {
            return UITableViewAutomaticDimension;
        } else {
            return 150;
        }
    }else if (indexPath.section == 3){
        
        if (self.welfareArr.count) {
            
            CGFloat height = [USERDEFAULTS floatForKey:@"collectionHeight"];
            return height;
        }else
            return 0.1;
        
    }else if (indexPath.section == 4){
        return 85;
    }else{
        return 50;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 3&&self.welfareArr.count == 0){
        return 0.1;
    }else
        return 12;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.detailModel){
        return 1;
    }else{
        return 0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        DetailHeaderCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"DetailHeaderCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.detailModel;
        self.moneyL = cell.moneyLabel;
        cell.peopleCountL.attributedText = self.sendCount;
        return cell;

    }else if (indexPath.section == 1){
    
        DetailsCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"DetailsCell" owner:nil options:nil]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.detailModel;
        self.addressL = cell.addressLabel;
        self.dateL = cell.workDateLabel;
        
        return cell;

    }else if (indexPath.section == 2){
        
        WorkDetailCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"WorkDetailCell" owner:nil options:nil]lastObject];
        if (_isMore == NO) {
            cell.workRequiredLabel.numberOfLines = 0;
            cell.workContentLabel.numberOfLines = 0;
            [cell.lookMoreBtn setTitle:@"已经到底啦" forState:UIControlStateNormal];
            cell.lookMoreBtn.userInteractionEnabled = NO;
            [cell.lookMoreBtn setImage:[UIImage new] forState:UIControlStateNormal];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.detailModel;
        cell.delegate =self;
        return cell;

        
    }
    else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.contentView.backgroundColor = KRGB(239, 239, 247,1);

        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ViewW, 40)];
        view.backgroundColor = KRGB(239, 239, 244,1);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ViewW, 20)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        [view addSubview:label];
        [cell.contentView addSubview:view];
        return cell;
    }
}


-(void)configBottomBar
{
    UIView *barView = [[UIView alloc] init];
    barView.backgroundColor = [UIColor whiteColor];
    barView.layer.shadowOpacity = 0.5;
    barView.layer.shadowOffset = CGSizeMake(0, 1);
    barView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.view addSubview:barView];
    [barView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(@(50));
        make.bottom.mas_equalTo(self.view.mas_bottom);
        
    }];

    //我要报名
    signUpBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signUpBtn.tag = 2; 
    signUpBtn.frame = CGRectMake(ViewW * 0.5, 0, ViewW * 0.5, 50);
    NSString *titleStr;
    if (self.detailModel.status.intValue == 0) {
        titleStr = @"我要报名";
        [signUpBtn setBackgroundColor:[GzwThemeTool theme]];
    }else{
        titleStr = @"已过期";
        signUpBtn.backgroundColor = [UIColor lightGrayColor];
        signUpBtn.userInteractionEnabled = NO;
    }
    if (self.hidden) {
        [signUpBtn setTitle:@"等待工作人员与您联系" forState:UIControlStateDisabled];
        signUpBtn.enabled = NO;
    }
    [signUpBtn setTitle:titleStr forState:UIControlStateNormal];
    [signUpBtn addTarget:self action:@selector(clickTosignUp:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:signUpBtn];
    
    chatBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    chatBtn.tag = 1;
    chatBtn.frame = CGRectMake(0, 0, ViewW * 0.5, 50);
    [chatBtn setTitleColor:[UIColor whiteColor] forState:0];
    chatBtn.backgroundColor = [UIColor redColor];
    [chatBtn setTitle:@"咨询客服" forState:UIControlStateNormal];
    [chatBtn setBackgroundColor:[GzwThemeTool theme]];
    [chatBtn addTarget:self action:@selector(clickTosignUp:) forControlEvents:UIControlEventTouchUpInside];
    [barView addSubview:chatBtn];
    
    
}

-(void)clickTosignUp:(UIButton *)btn
{
    NSNumber *n = [[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"];
    if (n.boolValue) {
       
    }else {
        CYloginRegisterViewController *loginRegister = [[CYloginRegisterViewController alloc] init];
        [self presentViewController:loginRegister animated:YES completion:nil];
        return;
    }

    if (btn.tag == 1) {
        MQChatViewManager *chatViewManager = [[MQChatViewManager alloc] init];
        [chatViewManager pushMQChatViewControllerInViewController:self];
    }else{
        int x = arc4random() % 100;
        [GzwHUDTool showWithStatus:@"请稍后..."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(x % 3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [GzwHUDTool dismiss];
            [signUpBtn setTitle:@"等待工作人员与您联系" forState:0];
            [GzwHUDTool showSuccessWithStatus:@"加入成功，工作日期间工作人员将与您联系"];
                NSMutableDictionary *dd =  [[NSUserDefaults standardUserDefaults] objectForKey:@"value"];
                
                NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:dd];
                NSData *saveObject = [NSKeyedArchiver archivedDataWithRootObject:self.model];
                dict[self.jobId.description] = saveObject;
                [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"value"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

/**
 *  查看更多
 */
-(void)clickMoreBtn:(UIButton *)btn content:(UILabel *)contentL require:(UILabel *)requireL
{
    _isMore = !_isMore;
    
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
