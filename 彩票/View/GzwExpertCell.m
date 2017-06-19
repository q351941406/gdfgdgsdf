//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwExpertCell.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
#import "Chameleon.h"
#import "UIImageView+WebCache.h"
@interface GzwExpertCell ()

/**
 *  视图 控件  CGRectMake
 */
#define Frame(x,y,w,h)  CGRectMake(x, y, w, h)

/*** 控件的x坐标 ***/
#define FrameX(v)       v.frame.origin.x

/*** 控件的y坐标 ***/
#define FrameY(v)       v.frame.origin.y

/*** 控件的宽 ***/
#define FrameW(v)       v.frame.size.width

/*** 控件的高 ***/
#define FrameH(v)       v.frame.size.height

/*** 控件的x+宽坐标 ***/
#define FrameXW(v)      (v.frame.origin.x + v.frame.size.width)

/*** 控件的y+高坐标 ***/
#define FrameYH(v)      (v.frame.origin.y + v.frame.size.height)
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UIView *decorationView;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIImageView *icon;



@end
@implementation GzwExpertCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.region.textColor = [GzwThemeTool subTitleTextTheme];
    self.number.textColor = [GzwThemeTool subTitleTextTheme];;

    self.icon.layer.cornerRadius = 20;
    self.icon.layer.masksToBounds = YES;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
    

    self.name.text = model[@"name"];
    self.region.text = model[@"lastTenStatusText"];
    self.number.text = model[@"bio"];
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model[@"avatar"]]];
}


@end
