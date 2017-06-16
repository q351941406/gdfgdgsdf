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
        NSArray *array = @[
        @{
            @"awardNo":@"1 3 3 3 1 1 1 0 3 1 3 3 3 1",
            @"awardTime":@"2017-06-15 14:41:01",
            @"extra":@"<null>",
            @"gameEn":@"football_9",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1797002&_t=1497537623.004345",
            @"luckyBlue":@"",
            @"periodName":@"17085",
            @"totalPool":@"0.00",
            @"totalSale":@"11354122.00",
        },
        @{
            @"awardNo":@"3 6 3 5 3 1 8",
            @"awardTime":@"2017-06-13 20:35:38",
            @"extra":@"<null>",
            @"gameEn":@"qxc",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1788454&_t=1497537071.420757",
            @"luckyBlue":@"",
            @"periodName":@"17068",
            @"totalPool":@"1000000.00",
            @"totalSale":@"11004592.00",
        },
        @{
            @"awardNo":@"02 11 12 23 29 31:05",
            @"awardTime":@"2017-06-15 21:23:15",
            @"extra":@"<null>",
            @"gameEn":@"ssq",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1789174&_t=1497536736.877167",
            @"luckyBlue":@"",
            @"periodName":@"2017069",
            @"totalPool":@"683978436.00",
            @"totalSale":@"326172358.00",
        },
        @{
            @"awardNo":@"07 08 19 24 27:06 07",
            @"awardTime":@"2017-06-14 20:35:24",
            @"extra":@"<null>",
            @"gameEn":@"dlt",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1788807&_t=1497536835.361406",
            @"luckyBlue":@"",
            @"periodName":@"17068",
            @"totalPool":@"3622286671.83",
            @"totalSale":@"209829116.00",
        },
        @{
            @"awardNo":@"8 7 2",
            @"awardTime":@"2017-06-15 21:26:03",
            @"extra":@"6 3 4",
            @"gameEn":@"x3d",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1795231&_t=1497536913.339654",
            @"luckyBlue":@"",
            @"periodName":@"2017159",
            @"totalPool":@"0.00",
            @"totalSale":@"44772604.00",
        },
        @{
            @"awardNo":@"1 2 3 8 6",
            @"awardTime":@"2017-06-15 20:33:37",
            @"extra":@"<null>",
            @"gameEn":@"pl5",
            @"html":@"http://client.310win.com/Info/Result/DigitResult.aspx?issueid=1795230&_t=1497537029.081689",
            @"luckyBlue":@"",
            @"periodName":@"17159",
            @"totalPool":@"268472453.44",
            @"totalSale":@"9144622.00",
        },
          ];
        
        [_data addObjectsFromArray:array];
    }
    return _data;
}
-(NSMutableArray *)dataTwo
{
    if (!_dataTwo) {
        _dataTwo = [NSMutableArray array];
        
        
        
        NSArray *array = @[
            @{
                @"type":@"jczq",
                @"matchDay":@"2017-06-14",
                @"teamA":@"桑托斯",
                @"teamB":@"帕梅拉斯",
                @"scoreA": @"1",
                @"scoreB": @"0",
                @"scores":@"1:0",
                @"concedeBall":@"-1"
            },
            @{
                @"type":@"dcsfgg",
                @"period":@"70603",
                @"teamA":@"科林蒂安",
                @"teamB":@"克鲁塞罗",
                @"scoreA": @"1",
                @"scoreB": @"0",
                @"scores":@"1:0",
                @"concedeBall":@"-0.5"
            },
            @{
                @"type":@"jclq",
                @"matchDay":@"2017-06-14",
                @"teamA":@"太阳",
                @"teamB":@"自由",
                @"scoreA": @"96",
                @"scoreB": @"76",
                @"scores":@"96:76",
                @"concedeBall":@"0"
            },
        ];
        [_dataTwo addObjectsFromArray:array];
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
    self.title = @"开奖结果";
    self.navigationItem.titleView = [self blueSegmentedControl];
    [self.view addSubview:self.two];
    [self.view addSubview:self.one];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
    VC.progressColor = [GzwThemeTool progressColor];
    if (tableView == self.one) {
        VC.webUrl = self.data[indexPath.row][@"html"];
    }else {
        VC.webUrl = self.dataTwo[indexPath.row][@"html"];
    }
    
    VC.LoadadvDesc = NO;
    [self.navigationController pushViewController:VC animated:YES];
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
