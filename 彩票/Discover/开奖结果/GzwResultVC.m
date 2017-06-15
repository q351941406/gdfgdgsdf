//
//  GzwAddressVC.m
//  pjh365
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwResultVC.h"
#import "GzwResutCell.h"
#import "AFNetworking.h"
#import "GzwThemeTool.h"
#import "GzwWebAdvertVC.h"
#import "Masonry.h"
#import "NYSegmentedControl.h"
#import "GzwResutTwoCell.h"
#import "GzwResultLotteryVC.h"


static NSString *ID = @"GzwResutCell";
static NSString *IDTwo = @"GzwResutTwoCell";

@interface GzwResultVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *one;
@property(nonatomic,strong)UITableView *two;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *dataTwo;
@end

@implementation GzwResultVC
-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
-(NSMutableArray *)dataTwo
{
    if (!_dataTwo) {
        _dataTwo = [NSMutableArray array];
    }
    return _dataTwo;
}
-(UITableView *)two
{
    if (!_two) {
        _two = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_two registerNib:[UINib nibWithNibName:IDTwo bundle:nil] forCellReuseIdentifier:IDTwo];
        _two.backgroundColor = [GzwThemeTool backgroudTheme];
        _two.estimatedRowHeight = 70; // 设置估算高度
        _two.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
        _two.delegate = self;
        _two.dataSource = self;
        _two.tableFooterView = [UIView new];
        
    }
    return _two;
}
-(UITableView *)one
{
    if (!_one) {
        _one = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_one registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
        _one.backgroundColor = [GzwThemeTool backgroudTheme];
        _one.estimatedRowHeight = 44; // 设置估算高度
        _one.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
        _one.delegate = self;
        _one.dataSource = self;
        _one.contentInset               = UIEdgeInsetsMake(64, 0, 0, 0);
        _one.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, 0);
        _one.tableFooterView = [UIView new];
    }
    return _one;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [self blueSegmentedControl];
    
    
    //    self.one.frame = self.view.frame;
    //    self.two.frame = self.view.frame;
    
    [self.view addSubview:self.two];
    [self.view addSubview:self.one];
    
    
    
    
    
    [self requst];
    [self requstTwo];
    [self.view setNeedsUpdateConstraints];// 标记更新约束
    
}
-(void)updateViewConstraints
{
    
    [self.one mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self.two mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [super updateViewConstraints];
}
-(void)requst{
    
    
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [mar POST:@"http://api.caipiao.163.com/award_home.html?product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=51D4039B-590F-4817-9298-6D4DC44324F9&product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=51D4039B-590F-4817-9298-6D4DC44324F9" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        [self.data addObjectsFromArray:responseObject[@"data"]];
        [responseObject[@"data"] enumerateObjectsUsingBlock:^(NSDictionary   *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = obj[@"totalSale"];
            if (!(str.integerValue < 1)) {
                [self.data addObject:obj];
            }
        }];
        [self.one reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
-(void)requstTwo{
    
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [mar POST:@"http://api.caipiao.163.com/award_awardInfoNew.html?product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=51D4039B-590F-4817-9298-6D4DC44324F9&product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=51D4039B-590F-4817-9298-6D4DC44324F9" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary  *responseObject) {
        NSLog(@"%@",responseObject);
//        [responseObject removeObjectForKey:@"result"];
        [responseObject enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (![key isEqualToString:@"result"] && ![key isEqualToString:@"dcspfPeriods"] && ![key isEqualToString:@"dcsfggPeriods"]) {
                [self.dataTwo addObject:@{key:obj}];
            }
            
        }];
        
        [self.two reloadData];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}


//// cell分割线的左边到尽头
//-(void)viewDidLayoutSubviews {
//    // 判断有没有实现这个方法
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        // 然后清零。
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//        
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//}

#pragma mark Action

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.one) {
        return self.data.count;
    }else {
        return self.dataTwo.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.one) {
        GzwResutCell *cell = [tableView dequeueReusableCellWithIdentifier:GzwResutCell.description];
        cell.model = self.data[indexPath.row];
        return cell;
    }else {
        GzwResutTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:GzwResutTwoCell.description];
        cell.model = self.dataTwo[indexPath.row];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
//    VC.progressColor = [GzwThemeTool progressColor];
//    VC.webUrl = self.data[indexPath.row][@"w_info_absolute_url"];
//    VC.LoadadvDesc = NO;
//    [self.navigationController pushViewController:VC animated:YES];
    GzwResultLotteryVC *vc = [[GzwResultLotteryVC alloc]initWithStyle:0];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


-(void)action:(NYSegmentedControl *)btn
{
    
    if (!btn.selectedSegmentIndex) {
        //        [self.two removeFromSuperview];
        //        [self.view addSubview:self.one];
        
        self.one.hidden = NO;
        self.two.hidden = YES;
        
    }else{
        self.one.hidden = YES;
        self.two.hidden = NO;
        //
        //        [self.one removeFromSuperview];
        //        [self.view addSubview:self.two];
    }
}
- (NYSegmentedControl *)blueSegmentedControl {
    NYSegmentedControl *blueSegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"彩票", @"体育"]];
    blueSegmentedControl.titleTextColor = [UIColor colorWithRed:0.38f green:0.68f blue:0.93f alpha:1.0f];
    blueSegmentedControl.selectedTitleTextColor = [UIColor whiteColor];
    blueSegmentedControl.segmentIndicatorBackgroundColor = [GzwThemeTool theme];// 滑块背景
    blueSegmentedControl.backgroundColor = [GzwThemeTool backgroudTheme];// 背景
    blueSegmentedControl.borderWidth = 0.0f;
    blueSegmentedControl.segmentIndicatorBorderWidth = 0.0f;
    blueSegmentedControl.segmentIndicatorInset = 2.0f;
    blueSegmentedControl.segmentIndicatorBorderColor = self.view.backgroundColor;
    blueSegmentedControl.cornerRadius = blueSegmentedControl.intrinsicContentSize.height / 2.0f;
    blueSegmentedControl.usesSpringAnimations = YES;
    blueSegmentedControl.frame = CGRectMake(0, 0, 100, 30);
    [blueSegmentedControl addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
    return blueSegmentedControl;
}
@end
