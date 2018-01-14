//
//  DiscoverVC.m
//  彩票
//
//  Created by mac on 2017/6/13.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "DiscoverVC.h"
#import "GzwThemeTool.h"

#import "WMPageController.h"
#import "WMTableViewController.h"
#import "WMViewController.h"
#import "WMCollectionViewController.h"
#import "GZWTool.h"
#import "GzwResultVC.h"
#import "GzwExpertVC.h"
@interface DiscoverVC ()
@property (weak, nonatomic) IBOutlet UITableViewCell *historyCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *expertCell;

@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"发现";
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
    

    self.tableView.separatorColor = [GzwThemeTool cellSeparatorTheme];
    self.historyCell.textLabel.font = [UIFont systemFontOfSize:15];
    self.expertCell.textLabel.font = self.historyCell.textLabel.font;
    
    self.historyCell.imageView.image = [[[UIImage imageNamed:@"icons8-Open Window_50"] gzw_imageWithColor:[GzwThemeTool cellIconFirstTheme]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.expertCell.imageView.image = [[[UIImage imageNamed:@"icons8-Personal Trainer_50"] gzw_imageWithColor:[GzwThemeTool cellIconFirstTheme]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.historyCell.textLabel.textColor = [GzwThemeTool titleTextTheme];
    self.expertCell.textLabel.textColor = [GzwThemeTool titleTextTheme];
    
    self.historyCell.textLabel.backgroundColor = [UIColor clearColor];
    self.expertCell.textLabel.backgroundColor = [UIColor clearColor];
    
    
    self.historyCell.backgroundColor = [GzwThemeTool cellBackgroudTheme];
    self.expertCell.backgroundColor = [GzwThemeTool cellBackgroudTheme];
     self.clearsSelectionOnViewWillAppear = YES;
    

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

#pragma mark - Table view data source


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
        {
             [self.navigationController pushViewController:[[GzwResultVC alloc]init] animated:YES];
        }
            break;
        case 1:
        {
            [self.navigationController pushViewController:[[GzwExpertVC alloc]initWithStyle:0] animated:YES];
        }
            break;
            
        default:
            break;
    }
   
    return;
    
    
    WMPageController *pageController = [self p_defaultController];
//    // 网易新闻
//    pageController = [self pageControllerStyleFlood];
//    pageController.menuHeight = 30;
//    pageController.itemsWidths = @[@10];
//    pageController.showOnNavigationBar = YES;
//    pageController.titleSizeSelected = 15;
//    pageController.menuViewStyle = WMMenuViewStyleSegmented;
//    pageController.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
//    pageController.titleColorSelected = [UIColor whiteColor];
//    pageController.titleColorNormal = [UIColor blackColor];
//    pageController.progressColor = [UIColor blackColor];
//    pageController.menuBGColor = [UIColor redColor];
    // 默认
    pageController.title = @"Default";
    pageController.preloadPolicy = WMPageControllerPreloadPolicyNeighbour;
     [self.navigationController pushViewController:pageController animated:YES];
    
}
- (WMPageController *)p_defaultController {
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i++) {
        Class vcClass;
        NSString *title;
        switch (i % 3) {
            case 0:
                vcClass = [GzwResultVC class];
                title = @"Greetings";
                break;
            case 1:
                vcClass = [WMViewController class];
                title = @"Hit Me";
                break;
            default:
                vcClass = [WMCollectionViewController class];
                title = @"Fluency";
                break;
        }
        [viewControllers addObject:vcClass];
        [titles addObject:title];
    }
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    pageVC.menuItemWidth = 85;
    pageVC.postNotification = YES;
    pageVC.bounces = YES;
    pageVC.hidesBottomBarWhenPushed = YES;
    return pageVC;
}
- (WMPageController *)pageControllerStyleFlood {
    NSArray *viewControllers = @[[WMTableViewController class], [WMViewController class], [WMCollectionViewController class]];
    NSArray *titles = @[@"通知", @"赞与感谢", @"私信"];
    
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    pageVC.titleSizeSelected = 15;
    pageVC.pageAnimatable = YES;
    pageVC.menuViewStyle = WMMenuViewStyleFlood;
    pageVC.titleColorSelected = [UIColor whiteColor];
    pageVC.titleColorNormal = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageVC.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageVC.itemsWidths = @[@(70),@(100),@(70)]; // 这里可以设置不同的宽度
    pageVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    //    pageVC.menuViewStyle = WMMenuViewStyleSegmented;
    return pageVC;
}
@end
