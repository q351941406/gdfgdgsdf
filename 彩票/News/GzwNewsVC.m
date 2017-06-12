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

@interface GzwNewsVC ()
@property(nonatomic,strong)GzwNewsOneVC *one;
@property(nonatomic,strong)GzwNewsTwoVC *two;
@end

@implementation GzwNewsVC
-(GzwNewsTwoVC *)two
{
    if (!_two) {
        _two = [[GzwNewsTwoVC alloc]initWithStyle:UITableViewStylePlain];
    }
    return _two;
}
-(GzwNewsOneVC *)one
{
    if (!_one) {
        _one = [[GzwNewsOneVC alloc]initWithStyle:UITableViewStylePlain];
    }
    return _one;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [self blueSegmentedControl];
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
    
    [self addChildViewController:self.one];
//    [self addChildViewController:self.two];
    [self.view addSubview:self.one.view];
//    [self.view addSubview:self.two.view];
    /*
     http://mycp.iplay78.com/trade-web/web/article_list // 足球
     {
     "article_list": {
     "category_code": "1",
     "page_index": 0,
     "page_size": 20
     },
     "c_head": {
     "client_id": "BY003000000000000002",
     "client_os": "IOS"
     }
     }
     */
    
    
    
    
    
    /*
     http://mycp.iplay78.com/trade-web/web/lottery/winners/list 福地
     {
     "winner_list": {
     "page_index": "1",
     "page_size": "20"
     },
     "c_head": {
     "client_id": "BY003000000000000002",
     "client_os": "IOS"
     }
     }
     */
}
-(void)action:(NYSegmentedControl *)btn
{
    if (btn.selectedSegmentIndex) {
        
    }else{
        
    }
}
- (NYSegmentedControl *)blueSegmentedControl {
    NYSegmentedControl *blueSegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"中奖福地", @"足球资讯"]];
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
