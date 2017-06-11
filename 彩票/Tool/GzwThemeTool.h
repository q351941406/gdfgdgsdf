//
//  GzwThemeTool.h
//  彩票
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface GzwThemeTool : NSObject
+(void)setup;

+(UIColor *)theme;
+(UIColor *)backgroudTheme;
+(UIColor *)tintTheme;
+(UIColor *)textTheme;
+(UIColor *)titleTextTheme;
+(UIColor *)titleTheme;
+(UIColor *)positiveTheme;
+(UIColor *)negativeTheme;
+(UIColor *)clearTheme;

@end
