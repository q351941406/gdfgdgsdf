//
//  HomeM.h
//  ScanCode
//
//  Created by Wang Jiang on 2017/5/25.
//  Copyright © 2017年 ScanCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeM : NSObject
@property(nonatomic,copy)NSString *iconName;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;
@property(nonatomic,copy) void (^block)(NSObject *view,NSObject *index);
@end
