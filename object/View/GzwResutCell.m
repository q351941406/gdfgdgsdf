//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwResutCell.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
#import "Chameleon.h"
@interface GzwResutCell ()

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


@property (strong, nonatomic) NSArray *redarray;
@property (strong, nonatomic) NSArray *bluearray;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) UILabel * redLab;
@property (strong, nonatomic) UILabel * blueLab;
@property (weak, nonatomic) IBOutlet UILabel *OpenCount;
@end
@implementation GzwResutCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool random];
    self.region.textColor = [GzwThemeTool subTitleTextTheme];
    self.number.textColor = FlatRed;
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
    

    NSString *str;
    NSString *n = model[@"awardNo"];
//    self.number.text = n;
    self.number.hidden = YES;
    
    if ([model[@"gameEn"] isEqualToString:@"football_9"]) {
        str = @"任选九";
//        self.number.textColor = FlatGreen;
    }
    if ([model[@"gameEn"] isEqualToString:@"qxc"]) {
        str = @"七星彩";
    }
    if ([model[@"gameEn"] isEqualToString:@"football_sfc"]) {
        str = @"胜负彩票";
//        self.number.textColor = FlatGreen;
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

    
    
    
    

    
    
    if ([model[@"awardNo"] rangeOfString:@"|"].location == NSNotFound) {
        _redarray = [model[@"awardNo"] componentsSeparatedByString:@","];
        
    } else {
        _array = [model[@"awardNo"] componentsSeparatedByString:@"|"];
        _redarray = [_array[0] componentsSeparatedByString:@","];
        _bluearray = [_array[1] componentsSeparatedByString:@","];
        
    }
    CGFloat w = 25;
    CGFloat p = 0;
    
    
    for (int i = 0; i<_redarray.count; i++) {
        _redLab = [[UILabel alloc]init];
        _redLab.tag = i;
        _redLab.backgroundColor = FlatRed;
        _redLab.font = [UIFont systemFontOfSize:13];
        _redLab.text = _redarray[i];
        _redLab.frame = Frame(20 + i*(w+10) , 30, w, w);
        _redLab.layer.cornerRadius = _redLab.frame.size.width / 2;
        //将多余的部分切掉
        _redLab.layer.masksToBounds = YES;
        _redLab.textAlignment = NSTextAlignmentCenter;
        _redLab.textColor = [UIColor whiteColor];
        if (i ==_redarray.count - 1) {
            p = FrameXW(_redLab);
        }
        [self.contentView addSubview:_redLab];
    }
    if (_bluearray) {
        for (int j = 0; j<_bluearray.count; j++) {
            _blueLab = [[UILabel alloc]init];
            _blueLab.tag = j;
            _blueLab.backgroundColor = FlatSkyBlue;
            _blueLab.text = _bluearray[j];
            _blueLab.frame = Frame(8 + j*(w+10)+p , 30 , w, w);
            _blueLab.font = [UIFont systemFontOfSize:13];
            _blueLab.layer.cornerRadius = _blueLab.frame.size.width / 2;
            //将多余的部分切掉
            _blueLab.layer.masksToBounds = YES;
            _blueLab.textAlignment = NSTextAlignmentCenter;
            _blueLab.textColor = [UIColor whiteColor];
            [self.contentView addSubview:_blueLab];
        }
    }
    
    
    
}

-(void)attributedString:(NSDictionary *)model
{
//    NSString *buyday                                       = model[@"awardNo"];
//    NSRange buydayRange=[buyday rangeOfString:@":"];//指定的字符串从左往右匹配（系统默认）。
//    //        NSRange range1=[@"sdfs:1233444444444" rangeOfString:@":" options:NSBackwardsSearch];//指定的字符串从右往左匹配
//    NSString *ddd = [buyday substringFromIndex:buydayRange.location];//截取下标2之后的字符串
//    NSString *strUrl = [buyday stringByReplacingOccurrencesOfString:@":" withString:@" "];
//    NSMutableAttributedString *timeAttributedString        = [[NSMutableAttributedString alloc]initWithString:strUrl];
//    //        [timeAttributedString setAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} range:NSMakeRange(buydayRange.location, 1)];
//    [timeAttributedString addAttributes:@{NSForegroundColorAttributeName:FlatSkyBlue} range:NSMakeRange(buydayRange.location, ddd.length)];
//    self.number.attributedText  = timeAttributedString;
}
@end
