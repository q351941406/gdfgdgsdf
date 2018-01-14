//
//  AppDelegate.m
//  彩票
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "AppDelegate.h"
#import "IWNavigationController.h"
#import "GzwTableView.h"0
#import <BmobSDK/Bmob.h>
#import "GzwWebAdvertVC.h"
#import "GzwNotificationTool.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
#import "GzwCouponsVC.h"
#import "GzwNewsVC.h"
#import "AFNetworking.h"
#import "HSSetTableInfoController.h"
#import <MeiQiaSDK/MeiQiaSDK.h>
#import "GzwThemeTool.h"
#import "Chameleon.h"
#import "GzwNwessVC.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

#import "Header.h"
#import "GzwYesTool.h"
@interface AppDelegate ()
@property(nonatomic,strong)UITabBarController *tb;
@end

@implementation AppDelegate


// 开奖记录彩客彩票2017、掌上彩票里的
// 专家推荐用彩客彩票2017

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MQManager initWithAppkey:@"7ddb09f1e9d2355a65ecb8c5188510c4" completion:^(NSString *clientId, NSError *error) {
    }];
    
    [GzwThemeTool setup];
//    [GzwNotificationTool registRemotePushNotification];
//    [GzwNotificationTool application:application didFinishLaunchingWithOptions:launchOptions];
//    [GzwNotificationTool cancelAllLocalNotifications];
    

    self.window                                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor                    = [UIColor whiteColor];
    
    
    
    self.window.rootViewController = [UIStoryboard storyboardWithName:@"mainSB" bundle:nil].instantiateInitialViewController;
    [self.window makeKeyAndVisible];

    
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBackgroundColor:[GzwThemeTool tabBarBackgroudTheme]];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
    
    UIColor *normalColor = [UIColor colorWithContrastingBlackOrWhiteColorOn:[GzwThemeTool theme] isFlat:YES alpha:0.4];
    UIColor *selectColor = ContrastColor([GzwThemeTool theme], YES);
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:normalColor} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:selectColor} forState:UIControlStateSelected];
    
    
    //b.创建子控制器

    GzwCouponsVC *c1=[[GzwCouponsVC alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.title=@"用户中心";
    

    c1.tabBarItem.image=[[[UIImage imageNamed:@"icons8-User_50"] gzw_imageWithColor:normalColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    IWNavigationController *nav1 = [[IWNavigationController alloc]initWithRootViewController:c1];

    GzwNwessVC *c2=[[GzwNwessVC alloc]initWithStyle:UITableViewStylePlain];
    c2.title=@"资讯";
    c2.tabBarItem.image=[[[UIImage imageNamed:@"icons8-News_50"] gzw_imageWithColor:normalColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    IWNavigationController *nav2 = [[IWNavigationController alloc]initWithRootViewController:c2];


    
    UIViewController *c3=[UIStoryboard storyboardWithName:@"Discover" bundle:nil].instantiateInitialViewController;
    c3.tabBarItem.title=@"发现";
    c3.tabBarItem.image=[[[UIImage imageNamed:@"icons8-Idea_50"] gzw_imageWithColor:normalColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    IWNavigationController *nav3 = [[IWNavigationController alloc]initWithRootViewController:c3];
    
    UIViewController *c4 = [UIStoryboard storyboardWithName:@"GzwInfoVC" bundle:nil].instantiateInitialViewController;
    c4.tabBarItem.title=@"用户中心";
    c4.tabBarItem.image=[[[UIImage imageNamed:@"icons8-User_50"] gzw_imageWithColor:normalColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    IWNavigationController *nav4 = [[IWNavigationController alloc]initWithRootViewController:c4];

    tb.viewControllers=@[nav2,nav1];
    UITabBar *tabBar = tb.tabBar;
//    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *item2 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:1];
    // 对item设置相应地图片
//    item0.selectedImage = [[[UIImage imageNamed:@"icons8-Dog House_50"] gzw_imageWithColor:selectColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[[UIImage imageNamed:@"icons8-News_50"] gzw_imageWithColor:selectColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    item2.selectedImage = [[[UIImage imageNamed:@"icons8-Idea_50"] gzw_imageWithColor:selectColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[[UIImage imageNamed:@"icons8-User_50"] gzw_imageWithColor:selectColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    self.tb = tb;
    
    [self setRootVC];

    [GzwYesTool application:application vc:nil];
    return YES;
}
-(void)setRootVC
{

                    self.window.rootViewController                 = self.tb;

    
    
}



- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
   
}
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
 
}

@end
