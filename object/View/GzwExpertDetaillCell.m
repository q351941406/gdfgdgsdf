//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwExpertDetaillCell.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
#import "Chameleon.h"
#import "UIImageView+WebCache.h"
@interface GzwExpertDetaillCell ()

@property (weak, nonatomic) IBOutlet UILabel *left;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *recommend;
@property (weak, nonatomic) IBOutlet UILabel *descriptions;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;




@end
@implementation GzwExpertDetaillCell

- (void)awakeFromNib {
//    self.decorationView.backgroundColor = [GzwThemeTool backgroudTheme];
//    self.region.textColor = [GzwThemeTool subTitleTextTheme];
//    self.number.textColor = [GzwThemeTool subTitleTextTheme];;
//
//    self.icon.layer.cornerRadius = 20;
//    self.icon.layer.masksToBounds = YES;
    self.backgroundColor = [GzwThemeTool cellBackgroudTheme];
    self.left.textColor = [GzwThemeTool titleTextTheme];
    self.title.textColor = [GzwThemeTool cellIconFirstTheme];
    
    self.recommend.textColor = [GzwThemeTool subTitleTextTheme];
    self.two.textColor = [GzwThemeTool subTitleTextTheme];
    self.one.textColor = [GzwThemeTool subTitleTextTheme];
    self.descriptions.textColor = [GzwThemeTool subTitleTextTheme];
    self.date.textColor = [GzwThemeTool subTitleTextSecondTheme];
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
    

    self.left.text = [NSString stringWithFormat:@"%@\n%@",model[@"recommendInfo"][@"matchName"],model[@"recommendInfo"][@"matchDateText"]];
    self.title.text = model[@"recommendInfo"][@"versusText"];
    self.recommend.text = [NSString stringWithFormat:@"%@ %@",model[@"recommendText"],model[@"viewText"]];
    self.descriptions.text = model[@"recommendInfo"][@"analysisText"];
    self.date.text = model[@"publishDateText"];
//    self.icon = [self.icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    if (model[@"isWon"]) {
        self.icon.image = [UIImage imageNamed:@"icons8-Happy_50"];
        self.icon.tintColor = FlatYellow;
    }else {
        self.icon.image = [UIImage imageNamed:@"icons8-Sad_50"];
        self.icon.tintColor = [GzwThemeTool subTitleTextSecondTheme];
    }
}


@end
