//
//  GzwExpertDetallVC.m
//  彩票
//
//  Created by Wang Jiang on 2017/6/20.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwExpertDetallVC.h"
#import "GzwThemeTool.h"
#import "GzwExpertDetaillCell.h"
#import "GzwMyOrderLogisticsHeaderV.h"
#import "ReactiveCocoa.h"

@interface GzwExpertDetallVC ()
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) GzwMyOrderLogisticsHeaderV *headView;
@end

@implementation GzwExpertDetallVC
-(GzwMyOrderLogisticsHeaderV *)headView
{
    if (!_headView) {
        _headView = [GzwMyOrderLogisticsHeaderV myOrderLogisticsHeaderV];
    }
    return _headView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    self.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        NSMutableArray *items = [[NSMutableArray alloc] init];
        [items addObject:@"分享的title"];
//        [items addObject:[UIImage imageNamed:@"ic_refund_busine"]];
        [items addObject:@"https://www.baidu.com"];
        
        UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
        NSMutableArray *excludedActivityTypes =  [NSMutableArray arrayWithArray:@[UIActivityTypeAirDrop, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeMail, UIActivityTypePostToTencentWeibo, UIActivityTypeSaveToCameraRoll, UIActivityTypeMessage, UIActivityTypePostToTwitter]];
        activityViewController.excludedActivityTypes = excludedActivityTypes;
        [self presentViewController:activityViewController animated:YES completion:nil];
        activityViewController.completionWithItemsHandler = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
            NSLog(@"%@  ----   %@", activityType, returnedItems);
        };
        return [RACSignal empty];
    }];
    self.tableView.separatorColor = [GzwThemeTool cellSeparatorTheme];
    self.tableView.backgroundColor = [GzwThemeTool backgroudTheme];
//    self.tableView.rowHeight = 80;
        self.tableView.estimatedRowHeight = 70; // 设置估算高度
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:GzwExpertDetaillCell.description bundle:nil] forCellReuseIdentifier:GzwExpertDetaillCell.description];
    self.clearsSelectionOnViewWillAppear = YES;
    self.headView.model = @{@"rate":self.dict[@"detaill"][@"rate"],@"figure":self.dict[@"detaill"][@"figure"]};
    self.tableView.tableHeaderView = self.headView;
    self.data = self.dict[@"detaill"][@"list"];
    [self.tableView reloadData];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GzwExpertDetaillCell *cell = [tableView dequeueReusableCellWithIdentifier:GzwExpertDetaillCell.description];
    cell.model = self.data[indexPath.row];
    return cell;
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

@end
