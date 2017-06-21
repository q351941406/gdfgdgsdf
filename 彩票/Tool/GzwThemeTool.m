//
//  GzwThemeTool.m
//  彩票
//
//  Created by mac on 2017/6/10.
//  Copyright © 2017年 彩票. All rights reserved.
//

#import "GzwThemeTool.h"
#import "Chameleon.h"
static NSArray *colorComplementary;
static NSArray *colorTriadic;
static NSArray *colorAnalogous;
static NSArray *colorForText;
@implementation GzwThemeTool
+(void)setup
{
    colorComplementary = [NSArray arrayOfColorsWithColorScheme:ColorSchemeComplementary usingColor:FlatPurple withFlatScheme:YES];
    colorTriadic = [NSArray arrayOfColorsWithColorScheme:ColorSchemeTriadic usingColor:FlatPurple withFlatScheme:YES];
    colorAnalogous = [NSArray arrayOfColorsWithColorScheme:ColorSchemeAnalogous usingColor:FlatPurple withFlatScheme:YES];
    
    
    colorForText = [NSArray arrayOfColorsWithColorScheme:ColorSchemeAnalogous usingColor:FlatBlackDark withFlatScheme:YES];
    [Chameleon setGlobalThemeUsingPrimaryColor:FlatPurple withSecondaryColor:nil andContentStyle:UIContentStyleContrast];
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[[UITableView class]]] setBackgroundColor:[UIColor clearColor]];
    
    
    
}
+(UIColor *)theme
{
    return FlatPurple;
}
+(UIColor *)backgroudTheme
{
    return colorComplementary[1];
}
+(UIColor *)cellBackgroudTheme
{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
}
+(UIColor *)tabBarBackgroudTheme
{
    return FlatPurple;
}
+(UIColor *)titleTextTheme;
{
    return colorAnalogous[1];
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
