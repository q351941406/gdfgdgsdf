//
//  AppDelegate.m
//  彩票
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "AppDelegate.h"
#import "IWNavigationController.h"
#import "GzwTableView.h"
#import <BmobSDK/Bmob.h>
#import "GzwWebAdvertVC.h"
#import "GzwNotificationTool.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GzwNotificationTool registRemotePushNotification];
    [GzwNotificationTool application:application didFinishLaunchingWithOptions:launchOptions];
    [GzwNotificationTool cancelAllLocalNotifications];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.window                                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor                    = [UIColor whiteColor];
    
    
    
    self.window.rootViewController = [UIStoryboard storyboardWithName:@"mainSB" bundle:nil].instantiateInitialViewController;
    [self.window makeKeyAndVisible];

    
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];

    //b.创建子控制器

    UIViewController *c1=[[UIViewController alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.tabBarItem.title=@"消息";
    c1.tabBarItem.image=[UIImage imageNamed:@"chats_icon"];
    IWNavigationController *nav1 = [[IWNavigationController alloc]initWithRootViewController:c1];

    
    
    UIImage *i = [UIImage imageNamed:@"pai5"];
    i = [i gzw_imageWithBlendColor:[UIColor redColor]];
    UIImageView *g = [[UIImageView alloc]initWithImage:i];
    g.frame = CGRectMake(10, 80, 300, 300);
    [c1.view addSubview:g];
    
    UIViewController *c2=[[UIViewController alloc]init];
    c2.view.backgroundColor=[UIColor brownColor];
    c2.tabBarItem.title=@"联系人";
    c2.tabBarItem.image=[UIImage imageNamed:@"chats_icon"];
    IWNavigationController *nav2 = [[IWNavigationController alloc]initWithRootViewController:c2];



    UIViewController *c3=[[UIViewController alloc]init];
    c3.tabBarItem.title=@"动态";
    c3.tabBarItem.image=[UIImage imageNamed:@"chats_icon"];
    IWNavigationController *nav3 = [[IWNavigationController alloc]initWithRootViewController:c3];
    
    
    UIViewController *c4=[[UIViewController alloc]init];
    c4.tabBarItem.title=@"设置";
    c4.tabBarItem.image=[UIImage imageNamed:@"chats_icon"];
    IWNavigationController *nav4 = [[IWNavigationController alloc]initWithRootViewController:c4];

    tb.viewControllers=@[nav1,nav2,nav3,nav4];
    
    
//    tb.tabBar.backgroundColor = [UIColor redColor];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [Bmob registerWithAppKey:@"d4143c09cdb7e5d485251b00b232c526"];
    //查找GameScore表
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"caipiao"];
    //查找GameScore表里面id为0c6db13c的数据
//    [bquery getObjectInBackgroundWithId:@"weJQPPPq" block:^(BmobObject *object,NSError *error){
//        if (error){
//            //进行错误处理
//        }else{
//            //表里有id为0c6db13c的数据
//            if (object) {
//                if ([[object objectForKey:@"pass"] boolValue]) {
//                    GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
//                    VC.progressColor = [UIColor colorWithRed:245/255.0f green:187/255.0f blue:200/255.0f alpha:1];
//                    
////                    VC.webUrl = @"http://www.33cp.com";
////                    VC.webUrl = @"http://www.dlc518.com";
//                    VC.webUrl = [object objectForKey:@"url"];
//                    VC.LoadadvDesc = NO;
//                    self.window.rootViewController = VC;
//                }else {
                    self.window.rootViewController                 = [[IWNavigationController alloc]initWithRootViewController:[[GzwTableView alloc] initWithStyle:UITableViewStyleGrouped]];
                    
                    self.window.rootViewController                 = tb;
//                }
//                
//            }
//        }
//    }];
    
    
    [GzwThemeTool setup];
    return YES;
}



// 系统获取到deviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [GzwNotificationTool registerDeviceToken:deviceToken];
}
// 远程通知前台或后台收到或点击通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler
{
    [GzwNotificationTool application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
// 本地的通知回调
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[GzwNotificationTool sharedGzwNotificationTool] application:application didReceiveLocalNotification:notification];
}




@end
