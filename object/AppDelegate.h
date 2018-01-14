//
//  AppDelegate.h
//  彩票
//
//  Created by mac on 2017/4/6.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;



+(void)getCookie;
@end

