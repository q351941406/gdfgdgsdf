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
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
@implementation GzwResutTwoCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool random];
    self.region.textColor = [GzwThemeTool subTitleTextTheme];

    self.bgView.backgroundColor = [GzwThemeTool backgroudTheme];
    self.bgView.layer.cornerRadius = 13;
    self.bgView.layer.masksToBounds = YES;
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
    
    self.number.textColor = FlatGreen;
    NSString *str;
    if ([model[@"type"] isEqualToString:@"dcspf"]){
        str = @"足球单场";
        self.number.textColor = FlatGreen;
        
        self.region.text = [NSString stringWithFormat:@"第%@期",model[@"period"]];
        self.number.text = [NSString stringWithFormat:@"%@      %@      %@",model[@"teamA"],model[@"scores"],model[@"teamB"]];
    }
    if ([model[@"type"] isEqualToString:@"dcsfgg"]){
        str = @"胜负过关";
        self.region.text = [NSString stringWithFormat:@"第%@期",model[@"period"]];
        self.number.text = [NSString stringWithFormat:@"%@      %@      %@",model[@"teamA"],model[@"scores"],model[@"teamB"]];
    }
    if ([model[@"type"] isEqualToString:@"jclq"]){
        str = @"竞彩篮球";
        self.region.text = [NSString stringWithFormat:@"客队VS主队 %@",model[@"matchDay"]];
        self.number.text = [NSString stringWithFormat:@"%@      %@      %@",model[@"teamA"],model[@"scores"],model[@"teamB"]];
        self.number.textColor = FlatYellow;
    }
    if ([model[@"type"] isEqualToString:@"jczq"]){
        str = @"竞彩足球";
        self.region.text = [NSString stringWithFormat:@"客队VS主队 %@",model[@"matchDay"]];
        self.number.text = [NSString stringWithFormat:@"%@      %@      %@",model[@"teamA"],model[@"scores"],model[@"teamB"]];
        self.bgView.backgroundColor = [GzwThemeTool backgroudTheme];
    }
    self.name.text = str;
    
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

@end
