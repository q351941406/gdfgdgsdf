//
//  GzwAddressVC.m
//  pjh365
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwNewsTwoVC.h"
#import "GzwAddressCell.h"
#import "AFNetworking.h"
#import "GzwThemeTool.h"
#import "GzwWebAdvertVC.h"
static NSString *ID = @"GzwAddressCell";

@interface GzwNewsTwoVC ()
@property (nonatomic, weak) UIView  *noDataView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation GzwNewsTwoVC
#pragma mark Get
-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}


#pragma mark Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.extendedLayoutIncludesOpaqueBars     = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.tableView registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
    self.clearsSelectionOnViewWillAppear = YES;
    
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
    self.tableView.estimatedRowHeight = 44; // 设置估算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
    
    [self requst];
}
-(void)requst{
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    mar.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    [mar POST:@"http://mycp.iplay78.com/trade-web/web/article_list" parameters:@{@"article_list":@{@"category_code":@"1",@"page_index":@"0",@"page_size":@"100"},@"c_head":@{@"client_id":@"BY003000000000000002",@"client_os":@"IOS"}} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
        
        self.data = responseObject[@"article_list"][@"comm_article"];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
// cell分割线的左边到尽头
-(void)viewDidLayoutSubviews {
    // 判断有没有实现这个方法
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        // 然后清零。
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

#pragma mark Action

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
    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
    VC.progressColor = [GzwThemeTool progressColor];
    VC.webUrl = self.data[indexPath.row][@"article_detail_url"];
    VC.LoadadvDesc = NO;
    [self.navigationController pushViewController:VC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}




@end
