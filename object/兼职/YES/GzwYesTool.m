//
//  GzwYesTool.m
//  彩票
//
//  Created by mac on 2017/11/2.
//  Copyright © 2017年 彩票. All rights reserved.
// https://github.com/vanyaland/ToThePenny

#import "GzwYesTool.h"
#import "GzwFirstVC.h"
#import <BmobSDK/Bmob.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import "MJExtension.h"
#import "GzwHomeModel.h"
#import "GzwViewController.h"
#import <StoreKit/StoreKit.h>

//pod 'BmobSDK'
#define aaa @"8ApZyghTPx0LbSj6" // 判断pass为这一串就显示
#define bbb @"mSdLGN8japKN0LU5" // 每个app都不同，用这个来找出是哪个pass
//its24034@sina.com Wawq1314    在用这个提交
static BOOL  loaded; // 当为YES时，程序在前台时就会打开web
static NSString *URL;// 最终链接
@implementation GzwYesTool

+(void)application:(UIApplication *)application vc:(UIViewController *)vc
{
//    application.keyWindow.rootViewController = [UIStoryboard storyboardWithName:@"GzwFirstVC" bundle:nil].instantiateInitialViewController;
    
    [Bmob registerWithAppKey:@"d4143c09cdb7e5d485251b00b232c526"];
    
    
//    [GzwYesTool loadData:^(NSMutableArray *array) {
//        GzwViewController *vc = [[GzwViewController alloc]init];
//        vc.datas = array;
//        [GzwYesTool setupRate];
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
//    }];
    
//    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0/*延迟执行时间*/ * NSEC_PER_SEC));
//
//    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
//
//    });
    

    
    //询问是否通过审核了
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"censoringPretend2"];// 表名

    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (error){
            
        }else{
            [array enumerateObjectsUsingBlock:^(BmobObject  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([[obj objectForKey:@"name"] isEqualToString:bbb]) {
                    if ([[obj objectForKey:@"pass"] isEqualToString:aaa]) {// 通过审核
//                        if ([GzwYesTool isSIMInstalled]) {//有SIM卡
                            [GzwYesTool getIp:^(NSDictionary *dcit) {
                                if ([dcit[@"data"][@"country_id"] isEqualToString:@"CN"]) {// 在中国
                                        loaded = YES;
                                        URL = [obj objectForKey:@"URL"];
//                                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];

                                    [GzwYesTool loadData:^(NSMutableArray *array) {
                                        GzwViewController *vc = [[GzwViewController alloc]init];
                                        vc.datas = array;
                                        [GzwYesTool setupRate];
                                        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc]initWithRootViewController:vc];
                                    }];

                                }else {// 不在中国
//                                    application.keyWindow.rootViewController = vc;
                                }
                            }];
//                        }else {// 无SIM卡
//                            application.keyWindow.rootViewController = vc;
//                        }
                    }else {// 在审核中
//                        application.keyWindow.rootViewController = vc;
                    }
                }
            }];
        }
    }];
}
+(void)applicationWillEnterForeground:(UIApplication *)application
{
//    if (loaded) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URL]];
//    }
}
+(void)loadData:(void (^)(NSMutableArray *array))block
{
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"tasks"];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        if (error){
            
        }else{
            if (array) {
                NSMutableArray *ma = [NSMutableArray array];
                NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(BmobObject *p1, BmobObject *p2){
                    return [[p1 objectForKey:@"sort"] compare:[p2 objectForKey:@"sort"]];
                }];
                for (BmobObject *kkk in sortedArray) {
                    NSDictionary *obj = [kkk mj_keyValues];
                    GzwHomeModel *model = [GzwHomeModel mj_objectWithKeyValues:[obj objectForKey:@"dataDic"]];
                    model.ID = [obj objectForKey:@"objectId"];
                    [ma addObject:model];
                }
                block(ma);
            }
        }
    }];
}
// 获取IP
+(void)getIp:(void (^)(NSDictionary *dcit))block
{
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://ip.taobao.com/service/getIpInfo.php?ip=myip"]] ;
    [request setHTTPMethod:@"POST"];
    NSURLSessionDataTask * task = [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@" ===000 %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding] );
        
        if (error == nil && data )
        {
            NSError * jsonError = nil ;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                block(jsonData);
            }];
            
        }
        return ;
    }];
    
    [task resume];
}
// 判断设备是否安装sim卡
+(BOOL)isSIMInstalled
{
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        NSLog(@"No sim present Or No cellular coverage or phone is on airplane mode.");
        return NO;
    }
    return YES;
}
+(void)setupRate
{
    [SKStoreReviewController requestReview];
//    // 获取全局队列
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    // 创建定时器
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//
//    // 开始时间
//    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
//
//    //    dispatch_time_t start = dispatch_walltime(NULL, 0);
//
//    // 重复间隔
//    uint64_t interval = (uint64_t)(5.0 * NSEC_PER_SEC);
//
//    // 设置定时器
//    dispatch_source_set_timer(_timer, start, interval, 0);
//
//    // 设置需要执行的事件
//    dispatch_source_set_event_handler(_timer, ^{
//        
//        //在这里执行事件
//        static NSInteger num = 0;
//
//        NSLog(@"%ld", (long)num);
//        num++;
//
//        if (num > 4) {
//
//            NSLog(@"end");
//
//            // 关闭定时器
//            dispatch_source_cancel(_timer);
//        }
//    });
//    // 开启定时器
//    dispatch_resume(_timer);
//
//    NSLog(@"start");
//
   
    
    
    
    
    
//    [iRate sharedInstance].applicationBundleID = @"www.jianzhidashi.jianzhidashi";
//    [iRate sharedInstance].onlyPromptIfLatestVersion = YES;
//    [iRate sharedInstance].daysUntilPrompt           = 0;
//    [iRate sharedInstance].usesUntilPrompt           = 1;
//    [iRate sharedInstance].remindPeriod              = 1;//下次提醒多少天后再提醒，缺省为1天
//    //enable preview mode 预览模式是否启用 测试YES 发布NO
//    [iRate sharedInstance].previewMode               = YES;
////    [iRate sharedInstance].verboseLogging = YES;
//    //    if ([[iRate sharedInstance] shouldPromptForRating]) {
//    //        [[iRate sharedInstance] promptForRating];
//    //    }
}
@end
