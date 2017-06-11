//
//  GzwFlashSaleVC.m
//  pjh365
//
//  Created by 嗨购 on 16/5/23.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwTableView.h"
#import "GzwFlashSaleCell.h"
#import "ODRefreshControl.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "GzwWebAdvertVC.h"
#import "SVProgressHUD.h"
#import "WMROOTViewController.h"



static NSString *ID = @"GzwFlashSaleCell";
@interface GzwTableView ()
@property (nonatomic, weak  ) UIView  *noDataView;
@property (nonatomic, strong) NSMutableArray            *data;
@property (nonatomic,strong ) MJRefreshAutoNormalFooter *footer;
@property (nonatomic,assign ) int                       page;
@property (nonatomic,strong ) NSArray                   *adURL;// 广告URL
@property (nonatomic,strong ) ODRefreshControl          *downRefresh;

@property (nonatomic, strong) NSTimer *timer;
@end

@implementation GzwTableView
- (NSMutableArray *)data
{
    if (!_data){
        _data = [[NSMutableArray alloc]init];
    }
    return _data;
}


-(MJRefreshAutoNormalFooter *)footer
{
    if (!_footer) {
        _footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshPullup)];
        _footer.triggerAutomaticallyRefreshPercent = 0.1;
        _footer.automaticallyHidden = YES;
    }
    return _footer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"彩票";
    [self.tableView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
//    self.tableView.backgroundColor = Gzw_appBackgroundColor;
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, -40, 0);
    self.tableView.tableFooterView = [UIView new];
//    self.tableView.tableHeaderView = self.headView;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 200; // 设置估算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
    
    self.page = 2;
//    self.downRefresh = [[ODRefreshControl alloc] initInScrollView:self.tableView];
//    [self.downRefresh addTarget:self action:@selector(refreshDown) forControlEvents:UIControlEventValueChanged];
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshDown)];
    self.tableView.mj_footer = self.footer;
    
    [self getPoster];
    [self.tableView.mj_header beginRefreshing];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"选号" style:0 target:self action:@selector(dddddd)];
    
    

}
-(void)dddddd
{
    WMROOTViewController *vc1 = [[WMROOTViewController alloc]init];
    vc1.title = @"购彩";
    [self.navigationController pushViewController:vc1 animated:YES];
}
-(UIStatusBarStyle)preferredStatusBarStyle

{
    
    return UIStatusBarStyleDefault;  //默认的值是黑色的
    
}
// 获取广告
-(void)getPoster
{
    
//    GzwHomeRequstM *requstModel = [[GzwHomeRequstM alloc]init];
//    requstModel.keyid = @"2";
//    @weakify(self);
//    [GzwHomeHttpTool getPoster:requstModel progress:nil success:^(NSURLSessionDataTask *successTask, id JSON) {
//        @strongify(self);
//        NSMutableArray *marray = [NSMutableArray array];
//        for (NSDictionary *dict in JSON[@"imgList"]) {
//            [marray addObject:[dict gzw_dictionaryByReplacingNullsWithStrings]];
//        }
//        self.adURL = [marray valueForKeyPath:@"actionurl"];
//        self.headView.cycleScrollView.imageURLStringsGroup = [JSON[@"imgList"] valueForKeyPath:@"imgurl"];
//        self.headView.cycleScrollView.autoScrollTimeInterval = [JSON[@"delaysecond"] floatValue];
//    } failure:^(NSURLSessionDataTask *errorTask, id CallBackError) {
//        [GzwHUDTool showErrorWithStatus:CallBackError[@"msg"]];
//    } timeout:nil];
}

// 上拉
-(void)refreshPullup
{
    [self requstDataPage:self.page refresh:NO];
}
// 下拉加载数据
-(void)refreshDown {
    [self requstDataPage:1 refresh:YES];
}
/**
 *  加载数据
 *
 *  @param page          页码
 *  @param isDownRefresh 是否为下拉
 */
-(void)requstDataPage:(int)page refresh:(BOOL)isDownRefresh
{
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    // 请求超时，默认是60秒(double类型的)
    mar.requestSerializer.timeoutInterval = 10.0001;
    // 增加一种请求声明
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    //    mar.requestSerializer = [AFJSONRequestSerializer serializer];
    //    mar.responseSerializer = [AFJSONResponseSerializer serializer];
    
    

    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"showapi_appid"] = @"35139";
    dict[@"showapi_sign"] = @"e4d231ccd1e64bada3cad88803bc93ff";
    dict[@"title"] = @"彩票";
    dict[@"needHtml"] = @"1";
//    dict[@"maxResult"] = @"20";
    
    dict[@"page"] = @(page).stringValue;
    

    [mar POST:@"http://route.showapi.com/109-35" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        if (uploadProgress) {
            
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
            if (isDownRefresh) {
                [self.data removeAllObjects];
                [self.data addObjectsFromArray:responseObject[@"showapi_res_body"][@"pagebean"][@"contentlist"]];
                self.page = 2;
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                self.tableView.mj_footer.hidden = NO;
                if (self.data.count == 0) {
                    self.tableView.mj_footer.hidden = YES;
                }
            }else{
                [self.data addObjectsFromArray:responseObject[@"showapi_res_body"][@"pagebean"][@"contentlist"]];
                [self.tableView.mj_footer endRefreshing];
                self.page++;
            }
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_header  endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GzwFlashSaleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.model = self.data[indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    GzwFlashSaleCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    GzwFlashSaleListVC *VC = [[GzwFlashSaleListVC alloc]init];
//    VC.model               = self.data[indexPath.section];
//    VC.endtime             = cell.time;
//    [self.navigationController pushViewController:VC animated:YES];
    
    
    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
    VC.progressColor = [UIColor colorWithRed:245/255.0f green:187/255.0f blue:200/255.0f alpha:1];
    
    VC.webUrl = self.data[indexPath.section][@"html"];
    VC.LoadadvDesc = YES;
    [self.navigationController pushViewController:VC animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}







-(void)viewDidLayoutSubviews {
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];

    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
@end
