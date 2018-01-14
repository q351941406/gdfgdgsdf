//
//  GzwNotificationTool.m
//  pjh365
//
//  Created by 嗨购 on 16/5/20.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwNotificationTool.h"
#import "Singleton.h"
//#import "JPUSHService.h"
//#import "ZxkConstKey.h"

@implementation GzwNotificationTool
singleton_implementation(GzwNotificationTool)


+(void)registRemotePushNotification
{
    // IOS8新系统需要使用新的代码咯
    if([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0){
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings
                                                                            settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
                                                                            categories:nil]];
        [[UIApplication sharedApplication]registerForRemoteNotifications];
    }else{//这里还是原来的代码
        //注册启用push
        [[UIApplication sharedApplication]registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge)];
    }
}
+(void)registJpushRemotePushNotification
{
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
//        //可以添加自定义categories
//        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
//                                                          UIUserNotificationTypeSound |
//                                                          UIUserNotificationTypeAlert)
//                                              categories:nil];
//    } else {
//        //categories 必须为nil
//        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
//                                                          UIRemoteNotificationTypeSound |
//                                                          UIRemoteNotificationTypeAlert)
//                                              categories:nil];
//    }
}
+(void)cancelAllLocalNotifications
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];// 取消所有的远程通知
}
+(void)unregisterForRemoteNotifications
{
     [[UIApplication sharedApplication] unregisterForRemoteNotifications];// 取消所有的远程通知
}
+(void)registerDeviceToken:(NSData *)deviceToken
{
//    // 字符串截取再去空格
//    NSString *tokenStr = [deviceToken description];
//    NSString *token = [HJBRegexTool replaceWithStr:[tokenStr substringWithRange:NSMakeRange(1, tokenStr.length-2)]];//按照给定的NSRang字符串截取自串的宽度和位置
//    NSLog(@"原始token%@",tokenStr);
//    NSLog(@"截取后的token :%@",token);
//    [JPUSHService registerDeviceToken:deviceToken];
}
+(void)registLocalPushNotification
{
    /*------------------------------------本地通知(测试)------------------------------------------------*/
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    NSLog(@"fireDate=%@",fireDate);
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitSecond;
    
    // 通知内容
    notification.alertBody =  @"通知内容test";
    notification.applicationIconBadgeNumber = 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSMutableDictionary *userDict = [NSMutableDictionary dictionary];
    userDict[@"type"] = @(1);
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSDayCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
+(BOOL)isOpenNotification
{
    // 判断是否有开启通知
    if([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {// system is iOS8 +
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        
        if(setting.types == UIUserNotificationTypeNone) {
            return NO;
        }
    }else {// iOS7
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        
        if(type == UIRemoteNotificationTypeNone){
            return NO;
        }
    }
    return YES;
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // 处理推送消息
    id type =  notification.userInfo[@"type"];
//    NSNumber *number = type;
//    MyMsgPlaySound *sound = [[MyMsgPlaySound alloc]init];
//    if (application.applicationState == UIApplicationStateActive) {//程序当前正处于前台
//        if (number.integerValue == 1) {// 如果是申请绑定推送
//            [[NSNotificationCenter defaultCenter] postNotificationName:bindingRemoteStateActivePush object:nil];
//            [sound play];
//        }
//    }
//    else if(application.applicationState == UIApplicationStateInactive){//程序处于后台
//        if (number.integerValue == 1) {// 如果是申请绑定推送
//            [[NSNotificationCenter defaultCenter] postNotificationName:bindingRemoteStateActivePush object:nil];
//        }
//    }
//    application.applicationIconBadgeNumber = 0;
    NSLog(@"收到推送消息:%@",[[notification.userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
}
+(void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //如不需要使用IDFA，advertisingIdentifier 可为nil
//    [JPUSHService setupWithOption:launchOptions appKey:JpushAppKey
//                          channel:nil
//                 apsForProduction:production
//            advertisingIdentifier:nil];
//    application.applicationIconBadgeNumber = 0;
}
+ (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler
{
//    if (![GzwNotificationTool isOpenNotification]) {
//        return;
//    }
//    [JPUSHService handleRemoteNotification:userInfo];
//    application.applicationIconBadgeNumber = 0;
}
@end
