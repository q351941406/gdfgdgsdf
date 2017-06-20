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
@interface GzwExpertDetallVC ()
@property (nonatomic, strong) NSArray *data;
@end

@implementation GzwExpertDetallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    self.tableView.backgroundColor = [GzwThemeTool backgroudTheme];
//    self.tableView.rowHeight = 80;
        self.tableView.estimatedRowHeight = 70; // 设置估算高度
        self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:GzwExpertDetaillCell.description bundle:nil] forCellReuseIdentifier:GzwExpertDetaillCell.description];
    self.clearsSelectionOnViewWillAppear = YES;
    
    self.data = self.dict[@"detaill"][@"list"];
    [self.tableView reloadData];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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
