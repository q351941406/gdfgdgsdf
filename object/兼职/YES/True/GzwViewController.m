//
//  ViewController.m
//  work
//
//  Created by pc on 2017/8/10.
//  Copyright © 2017年 pc. All rights reserved.
//



#define HeaderH 240
#import "GzwViewController.h"
#import "GzwYesTool.h"
#import "GzwFHHomeCell.h"




#import "GzwHomeModel.h"
#import "AppDelegate.h"
static NSString *const menuCellIdentifier = @"rotationCell";

@interface GzwViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation GzwViewController




#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
   
    
    [self initUI];


    
   
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = NO;
}
-(void)initUI
{
    self.title = @"赚钱大厅";
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.view addSubview:self.tableView];
}


#pragma mark - action



#pragma mark - tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

        GzwHomeModel *model = self.datas[indexPath.row];
        model.row = indexPath.row;
        GzwFHHomeCell *cell = [GzwFHHomeCell cellWithTableView:tableView];
        cell.model = model;
        return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

   
    
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        GzwHomeModel *model = self.datas[indexPath.row];
        
        AppDelegate *a = (AppDelegate *)[UIApplication sharedApplication].delegate;
        
    
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:model.URL]];
    

    
}








#pragma mark - getter
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.bounces = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.estimatedRowHeight = 70;
        _tableView.rowHeight = UITableViewAutomaticDimension;
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}




@end
