//
//  GzwNwesVC.m
//  彩票
//
//  Created by mac on 2018/1/7.
//  Copyright © 2018年 彩票. All rights reserved.
//

#import "GzwNwessVC.h"
#import "GzwThemeTool.h"
#import "Masonry.h"
#import "AFNetworking.h"
#import "GzwAddressCell.h"
#import "GzwCouponsHeadView.h"
#import "GZWTool.h"
#import "GzwObject.h"
#import <MJRefresh/MJRefresh.h>
#import "JianZhiDetailController.h"
#import "MJExtension.h"
static NSString *ID = @"GzwAddressCell";
@interface GzwNwessVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic,strong ) GzwCouponsHeadView        *headView;
@property (assign, nonatomic) NSInteger pageNum;
@end

@implementation GzwNwessVC
-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}
-(GzwCouponsHeadView *)headView
{
    if (!_headView) {
        _headView = [[GzwCouponsHeadView alloc]init];
        _headView.height = ViewW*0.35;
    }
    return _headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.view addSubview:self.one];
    self.pageNum = 1;
    [self.tableView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.tableView.estimatedRowHeight = 44; // 设置估算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
    self.tableView.separatorColor = [GzwThemeTool cellSeparatorTheme];
    self.tableView.tableHeaderView = self.headView;
    
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.pageNum ++;
        [self requst2];
    }];
    self.tableView.mj_footer = footer;
    

    [self requst2];
}
-(void)requst2{
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"pageNum"] = @(self.pageNum);
    mar.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    [mar GET:@"http://101.200.195.147:9090/job/user/list/0899" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.pageNum == 1) {
            [self.data removeAllObjects];
        }
        NSArray *dataAry = responseObject[@"data"];
        for (NSDictionary *dddd in dataAry) {
            GzwObject *model = [[GzwObject alloc] init];
            model.title = dddd[@"job_name"];
            model.subtitle = dddd[@"address"];
            model.name = [NSString stringWithFormat:@"%@元",dddd[@"money"]];
            model.isNormol = YES;
            model.ID = dddd[@"id"];
            NSRange range = [model.title rangeOfString:@"试玩"];//判断字符串是否包含
            if (range.location ==NSNotFound)//不包含
            {
                [self.data addObject:model];
            }
        }
        if (dataAry.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GzwAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.model = self.data[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GzwObject *model = self.data[indexPath.row];
    JianZhiDetailController *detail = [[JianZhiDetailController alloc] init];
    detail.jobId = model.ID;
    detail.model = model;
    [self.navigationController pushViewController:detail animated:YES];
}



@end
