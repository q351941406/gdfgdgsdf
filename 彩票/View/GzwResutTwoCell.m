//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwResutTwoCell.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
#import "Chameleon.h"
@interface GzwResutTwoCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UIView *decorationView;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end
@implementation GzwResutTwoCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.region.textColor = [GzwThemeTool subTitleTextTheme];
    self.number.textColor = FlatRed;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
    

    NSString *str;
    NSString *n = model[@"awardNo"];
    self.number.text = n;
    
    
    if ([model[@"gameEn"] isEqualToString:@"football_9"]) {
        str = @"任选九";
        self.number.textColor = FlatGreen;
    }
    if ([model[@"gameEn"] isEqualToString:@"qxc"]) {
        str = @"七星彩";
    }
    if ([model[@"gameEn"] isEqualToString:@"football_sfc"]) {
        str = @"胜负彩票";
        self.number.textColor = FlatGreen;
    }
    if ([model[@"gameEn"] isEqualToString:@"ssq"]) {
        str = @"双色球";
        
        [self attributedString:model];
    }
    if ([model[@"gameEn"] isEqualToString:@"dlt"]) {
        str = @"大乐透";
        
        [self attributedString:model];
    }
    if ([model[@"gameEn"] isEqualToString:@"x3d"]) {
        str = @"3D";
    }
    if ([model[@"gameEn"] isEqualToString:@"pl5"]) {
        str = @"排列5";
    }
    if ([model[@"gameEn"] isEqualToString:@"qlc"]) {
        str = @"七乐彩";
    }
    if ([model[@"gameEn"] isEqualToString:@"qlc"]) {
        str = @"排列3";
        [self attributedString:model];
    }
    self.name.text = str;
    self.region.text = [NSString stringWithFormat:@"第%@期%@",model[@"periodName"],model[@"awardTime"]];
//    if ([[model allKeys] containsObject:@"w_title_template"]){
//        
//        self.name.text = [self flattenHTML:model[@"w_title_template"] trimWhiteSpace:NO];
//        self.region.text = [NSString stringWithFormat:@"%@%@期",model[@"w_lot_name"],model[@"w_expert"]];
//        
//    }else {
//        self.name.text = [self flattenHTML:model[@"article_title"] trimWhiteSpace:NO];
//        
//        NSDate *currentTime = [NSDate dateWithTimeIntervalSince1970:[model[@"crt_time"] integerValue]/1000];
//        self.region.text = [NSString stringWithFormat:@"%@",currentTime];
//    }
}

-(void)attributedString:(NSDictionary *)model
{
    NSString *buyday                                       = model[@"awardNo"];
    NSRange buydayRange=[buyday rangeOfString:@":"];//指定的字符串从左往右匹配（系统默认）。
    //        NSRange range1=[@"sdfs:1233444444444" rangeOfString:@":" options:NSBackwardsSearch];//指定的字符串从右往左匹配
    NSString *ddd = [buyday substringFromIndex:buydayRange.location];//截取下标2之后的字符串
    NSString *strUrl = [buyday stringByReplacingOccurrencesOfString:@":" withString:@" "];
    NSMutableAttributedString *timeAttributedString        = [[NSMutableAttributedString alloc]initWithString:strUrl];
    //        [timeAttributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(buydayRange.location, 1)];
    [timeAttributedString addAttributes:@{NSForegroundColorAttributeName:FlatSkyBlue} range:NSMakeRange(buydayRange.location, ddd.length)];
    self.number.attributedText  = timeAttributedString;
}
@end
