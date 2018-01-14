//
//  GzwObject.h
//  彩票
//
//  Created by mac on 2018/1/7.
//  Copyright © 2018年 彩票. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GzwObject : NSObject
@property (nonatomic,assign) NSInteger row;
@property (nonatomic,assign) NSInteger zhi_ID;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSInteger chose_count;

@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *URL;

@property (nonatomic,assign) BOOL isNormol;
@end
