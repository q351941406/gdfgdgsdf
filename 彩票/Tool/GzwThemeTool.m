//
//  GzwThemeTool.m
//  彩票
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwThemeTool.h"
#import "Chameleon.h"
@implementation GzwThemeTool
+(void)setup
{
    [Chameleon setGlobalThemeUsingPrimaryColor:FlatPurple withSecondaryColor:FlatBrown andContentStyle:UIContentStyleContrast];
}
@end
