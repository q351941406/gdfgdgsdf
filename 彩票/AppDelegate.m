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
@interface AppDelegate ()

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
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    self.window                                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor                    = [UIColor whiteColor];
    
    
    
    self.window.rootViewController = [UIStoryboard storyboardWithName:@"mainSB" bundle:nil].instantiateInitialViewController;
    [self.window makeKeyAndVisible];

    
    //a.初始化一个tabBar控制器
    UITabBarController *tb=[[UITabBarController alloc]init];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBackgroundColor:[GzwThemeTool theme]];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor redColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
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
//                    self.window.rootViewController                 = [[IWNavigationController alloc]initWithRootViewController:[[GzwTableView alloc] initWithStyle:UITableViewStyleGrouped]];
    
    
                    self.window.rootViewController                 = tb;
//                }
//                
//            }
//        }
//    }];
    
    
    
    [AppDelegate getCookie];
    return YES;
}
+(void)getCookie
{
    
    AFHTTPSessionManager *mar=[AFHTTPSessionManager manager];
    mar.responseSerializer.acceptableContentTypes = [mar.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    
    
    
    NSString *yy = [self dddd:@{@"appInfo":@{@"clientType":@2,@"clientName":@"com.228cai.iphone.lottery",@"agent":@"f376",@"version":@{@"name":@"4.5",@"code":@2158}},
                                @"deviceId":@"1265177",
                                @"systemInfo":@{@"os":@"iOS 10.3.2",@"networkType":@"Unknown"},
                                @"ignoreAppVersion":@"false",
                                @"baseDataStructureVersion":@"3.9",
                                @"trackInfo":@{@"iosIdfa":@"58C5D00C-3445-460C-A9A5-78C2D83D657A",@"iosIdfv":@"3E1EC34B-D56F-4EF5-8602-BEB4FBE09B34"},
                                }
                    ];
    yy = [yy stringByReplacingOccurrencesOfString:@" " withString:@""];
    yy = [yy stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    yy = [yy stringByReplacingOccurrencesOfString:@"iOS" withString:@"iOS "];
    [mar POST:@"http://client.310win.com/Default.aspx?transcode=1001&deviceid=1265177&client=2&version=3.9" parameters:@{@"baseinfoversion":@"2_3.9|G1H1I1J1K1L1M1N1O1P1Q1R1S1T1U1V1W1",@"key":@"d28b8c206d84dc07f91cd234f249f8a8",@"msg":yy} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSHTTPURLResponse *rre = (NSHTTPURLResponse *)task.response;
        //        NSLog(@"%@----%@",task.currentRequest.allHTTPHeaderFields,rre.allHeaderFields[@"Set-Cookie"]);
        [[NSUserDefaults standardUserDefaults] setObject:rre.allHeaderFields[@"Set-Cookie"] forKey:@"Cookie"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"OK" object:nil userInfo:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}
+ (NSString*)dddd:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
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
