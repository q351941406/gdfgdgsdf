//
//  GzwThemeTool.m
//  彩票
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwThemeTool.h"
#import "Chameleon.h"
static NSArray *colorArray;
@implementation GzwThemeTool
+(void)setup
{
    colorArray = [NSArray arrayOfColorsWithColorScheme:ColorSchemeComplementary usingColor:FlatPurple withFlatScheme:YES];
    [Chameleon setGlobalThemeUsingPrimaryColor:FlatPurple withSecondaryColor:nil andContentStyle:UIContentStyleContrast];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UITableView class]]] setBackgroundColor:[UIColor clearColor]];
    
    
    
}
+(UIColor *)theme
{
    return FlatPurple;
}
+(UIColor *)backgroudTheme
{
    return colorArray[1];
}
+(UIColor *)cellBackgroudTheme
{
    NSArray *a = [NSArray arrayOfColorsWithColorScheme:ColorSchemeComplementary usingColor:colorArray[1] withFlatScheme:YES];
    return FlatForestGreen;
}
+(UIColor *)tabBarBackgroudTheme
{
    return FlatSand;
}
+(UIColor *)titleTextTheme;
{
    return FlatSkyBlue;
}
+(UIColor *)subTitleTextTheme
{
    return FlatWhite;
}
+(UIColor *)currentPageColor
{
    return RandomFlatColor;
}
+(UIColor *)pageColor
{
    return RandomFlatColor;
}
+(UIColor *)progressColor
{
    return RandomFlatColor;
}
+(UIColor *)random
{
    return RandomFlatColor;
}
@end
