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
#import "GzwCouponsVC.h"
#import "GzwNewsVC.h"
#import "AFNetworking.h"
#import "HSSetTableInfoController.h"
#import <MeiQiaSDK/MeiQiaSDK.h>
#import "GzwThemeTool.h"

// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


// 开奖记录彩客彩票2017、掌上彩票里的
// 专家推荐用彩客彩票2017

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MQManager initWithAppkey:@"5979a4368c7786c76b58306036952553" completion:^(NSString *clientId, NSError *error) {
    }];
    [GzwThemeTool setup];
    [GzwNotificationTool registRemotePushNotification];
    [GzwNotificationTool application:application didFinishLaunchingWithOptions:launchOptions];
    [GzwNotificationTool cancelAllLocalNotifications];
    
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:@"a506b2db2a5c97cad4b8a677"
                          channel:@"App Store"
                 apsForProduction:YES
            advertisingIdentifier:nil];
    
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
//
//    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    
    //b.创建子控制器

    GzwCouponsVC *c1=[[GzwCouponsVC alloc]init];
    c1.view.backgroundColor=[UIColor grayColor];
    c1.title=@"大厅";
    c1.tabBarItem.image=[UIImage imageNamed:@"icons8-Dog House_50"];
    IWNavigationController *nav1 = [[IWNavigationController alloc]initWithRootViewController:c1];

    
    
//    UIImage *i = [UIImage imageNamed:@"pai5"];
//    i = [i gzw_imageWithBlendColor:[UIColor redColor]];
//    UIImageView *g = [[UIImageView alloc]initWithImage:i];
//    g.frame = CGRectMake(10, 80, 300, 300);
//    [c1.view addSubview:g];
//    tb.tabBarItem
    GzwNewsVC *c2=[[GzwNewsVC alloc]init];
    c2.title=@"资讯";
    c2.tabBarItem.image=[UIImage imageNamed:@"icons8-News_50"];
    IWNavigationController *nav2 = [[IWNavigationController alloc]initWithRootViewController:c2];


    
    UIViewController *c3=[UIStoryboard storyboardWithName:@"Discover" bundle:nil].instantiateInitialViewController;
    c3.tabBarItem.title=@"发现";
    c3.tabBarItem.image=[UIImage imageNamed:@"icons8-Idea_50"];
    IWNavigationController *nav3 = [[IWNavigationController alloc]initWithRootViewController:c3];
    
    UIViewController *c4 = [UIStoryboard storyboardWithName:@"GzwInfoVC" bundle:nil].instantiateInitialViewController;
    c4.tabBarItem.title=@"用户中心";
    c4.tabBarItem.image=[UIImage imageNamed:@"icons8-User_50"];
    IWNavigationController *nav4 = [[IWNavigationController alloc]initWithRootViewController:c4];

    tb.viewControllers=@[nav1,nav2,nav3,nav4];
    UITabBar *tabBar = tb.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    // 对item设置相应地图片
    item0.selectedImage = [[[UIImage imageNamed:@"icons8-Dog House_50"] gzw_imageWithColor:[UIColor whiteColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.selectedImage = [[[UIImage imageNamed:@"icons8-News_50"] gzw_imageWithColor:[UIColor whiteColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[[UIImage imageNamed:@"icons8-Idea_50"] gzw_imageWithColor:[UIColor whiteColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.selectedImage = [[[UIImage imageNamed:@"icons8-User_50"] gzw_imageWithColor:[UIColor whiteColor]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    tb.tabBar.backgroundColor = [UIColor redColor];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
//    [Bmob registerWithAppKey:@"d4143c09cdb7e5d485251b00b232c526"];
//    查找GameScore表
//    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"caipiao"];
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
//                    self.window.rootViewController                 = [[IWNavigationController alloc]initWithRootViewController:[[GzwTableView alloc] initWithStyle:UITableViewStyleGrouped]];
    
    
//                    self.window.rootViewController                 = tb;
//                }
//                
//            }
//        }
//    }];
    
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [mar GET:@"http://appmgr.jwoquxoc.com/frontApi/getAboutUs?appid=c66app10" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
        NSNumber *i = responseObject[@"isshowwap"];
        if (i.intValue == 1) {
            GzwWebAdvertVC *VC = [[GzwWebAdvertVC alloc]init];
//            VC.webUrl = @"http://www.33cp.com";
//            VC.webUrl = @"http://www.dlc518.com";
            VC.webUrl = responseObject[@"wapurl"];
            VC.LoadadvDesc = NO;
            self.window.rootViewController = VC;
        }else if (i.intValue == 2){
            self.window.rootViewController                 = tb;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];

    return YES;
}




//// 系统获取到deviceToken
//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
//{
//    [GzwNotificationTool registerDeviceToken:deviceToken];
//}
//// 远程通知前台或后台收到或点击通知
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler
//{
//    [GzwNotificationTool application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
//}
//// 本地的通知回调
//- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
//{
//    [[GzwNotificationTool sharedGzwNotificationTool] application:application didReceiveLocalNotification:notification];
//}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

@end
