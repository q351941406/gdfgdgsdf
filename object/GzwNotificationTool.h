//
//  GzwNotificationTool.h
//  pjh365
//
//  Created by 嗨购 on 16/5/20.
//  Copyright © 2016年 bigkoo. All rights reserved.
//  通知工具类

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import <UIKit/UIKit.h>
@interface GzwNotificationTool : NSObject
singleton_interface(GzwNotificationTool)

/**
 *  注册远程推送通知
 */
+(void)registRemotePushNotification;
/**
 *  取消远程通知
 */
+(void)unregisterForRemoteNotifications;
/**
 *  注册极光远程推送通知
 */
+(void)registJpushRemotePushNotification;
/**
 *  是否开起远程推送
 *
 *  @return YES 开启  NO 关闭
 */
+(BOOL)isOpenNotification;

/**
 *  获取token
 *
 *  @param deviceToken 二进制token
 */
+(void)registerDeviceToken:(NSData *)deviceToken;

/**
 *  注册本地推送通知
 */
+(void)registLocalPushNotification;
/**
 *  取消本地通知
 */
+(void)cancelAllLocalNotifications;

// 本地的通知回调
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification;
// 程序启动
+(void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
// 前台或后台收到或点击通知
+ (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler;
@end
