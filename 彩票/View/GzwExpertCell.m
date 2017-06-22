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

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UIView *decorationView;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIImageView *icon;



@end
@implementation GzwExpertCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.region.textColor = [GzwThemeTool subTitleTextSecondTheme];
    self.number.textColor = [GzwThemeTool subTitleTextTheme];;

    self.icon.layer.cornerRadius = 20;
    self.icon.layer.masksToBounds = YES;
    self.backgroundColor = [GzwThemeTool cellBackgroudTheme];
    self.name.textColor = [GzwThemeTool titleTextTheme];
    
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
