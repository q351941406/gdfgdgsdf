//
//  GzwNewsVC.m
//  彩票
//
//  Created by Wang Jiang on 2017/6/12.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwNewsVC.h"
#import "NYSegmentedControl.h"
#import "GzwThemeTool.h"
#import "GzwNewsTwoVC.h"
#import "GzwNewsOneVC.h"
#import "GZWTool.h"
#import "Masonry.h"

#import "GzwAddressCell.h"
#import "AFNetworking.h"
#import "GzwThemeTool.h"
#import "GzwWebAdvertVC.h"

static NSString *ID = @"GzwAddressCell";
@interface GzwNewsVC () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *one;
@property(nonatomic,strong)UITableView *two;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *dataTwo;
@end

@implementation GzwNewsVC
#pragma mark Get
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
        [_two registerNib:[UINib nibWithNibName:ID bundle:nil] forCellReuseIdentifier:ID];
        _two.backgroundColor = [GzwThemeTool backgroudTheme];
        _two.estimatedRowHeight = 44; // 设置估算高度
        _two.rowHeight = UITableViewAutomaticDimension; // 告诉tableView我们cell的高度是自动的
        _two.delegate = self;
        _two.dataSource = self;
        
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
        _one.contentInset               = UIEdgeInsetsMake(64, 0, 49, 0);
        _one.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 49, 0);
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
    
    mar.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    [mar POST:@"http://mycp.iplay78.com/trade-web/web/lottery/winners/list" parameters:@{@"winner_list":@{@"page_index":@"1",@"page_size":@"100"},@"c_head":@{@"client_id":@"BY003000000000000002",@"client_os":@"IOS"}} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
        self.data = responseObject[@"winner_list"][@"data"];
        [self.one reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
-(void)requstTwo{
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    mar.requestSerializer=[AFJSONRequestSerializer serializer];//申明请求的数据是json类型
    [mar POST:@"http://mycp.iplay78.com/trade-web/web/article_list" parameters:@{@"article_list":@{@"category_code":@"1",@"page_index":@"0",@"page_size":@"100"},@"c_head":@{@"client_id":@"BY003000000000000002",@"client_os":@"IOS"}} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //        NSLog(@"%@",responseObject);
        
        self.dataTwo = responseObject[@"article_list"][@"comm_article"];
        [self.two reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.one) {
        return self.data.count;
    }else {
        return self.dataTwo.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GzwAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (tableView == self.one) {
        cell.model = self.data[indexPath.row];
    }else {
        cell.model = self.dataTwo[indexPath.row];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
    VC.progressColor = [GzwThemeTool progressColor];
    if (tableView == self.one) {
        VC.webUrl = self.data[indexPath.row][@"w_info_absolute_url"];
    }else {
        VC.webUrl = self.dataTwo[indexPath.row][@"article_detail_url"];
    }
    
    VC.LoadadvDesc = NO;
    [self.navigationController pushViewController:VC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
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
    NYSegmentedControl *blueSegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"中奖福地", @"足球资讯"]];
    blueSegmentedControl.titleTextColor = [GzwThemeTool theme];
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
