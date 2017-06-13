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
@interface DiscoverVC ()
@property (weak, nonatomic) IBOutlet UITableViewCell *historyCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *expertCell;

@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    http://client.310win.com/Default.aspx?transcode=500&deviceid=1265177&client=2&version=3.9   热门
//    http://client.310win.com/Default.aspx?transcode=500&deviceid=1265177&client=2&version=3.9
    self.title = @"发现";
    self.view.backgroundColor = [GzwThemeTool backgroudTheme];
    
//    self.historyCell.imageView.tintColor = [GzwThemeTool random];
//    self.expertCell.imageView.tintColor = [GzwThemeTool random];
    
    self.historyCell.textLabel.font = [UIFont systemFontOfSize:13];
    self.expertCell.textLabel.font = self.historyCell.textLabel.font;
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
                vcClass = [WMTableViewController class];
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
