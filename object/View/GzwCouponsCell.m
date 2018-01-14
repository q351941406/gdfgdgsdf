//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwCouponsCell.h"
#import "HomeM.h"
#import "GZWTool.h"
#import "GzwThemeTool.h"
#import "Chameleon.h"
@interface GzwCouponsCell ()
/**
 *  商品图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
/**
 *  商品名
 */
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
/**
 *  现价
 */
@property (weak, nonatomic) IBOutlet UILabel *currentPrice;



@end
@implementation GzwCouponsCell

- (void)awakeFromNib {
    self.goodsName.textColor = [GzwThemeTool titleTextTheme];
    self.currentPrice.textColor = [GzwThemeTool subTitleTextTheme];
    self.backgroundColor = [GzwThemeTool cellBackgroudTheme];
}
#pragma mark Set
-(void)setModel:(HomeM *)model
{
    _model = model;
    
    UIImage *i = [UIImage imageNamed:model.iconName];
    UIColor *color =  RandomFlatColorExcluding(@[[GzwThemeTool backgroudTheme]]);
    i = [i gzw_imageWithBlendColor:color];
    
    self.goodsImage.image = [UIImage imageNamed:model.iconName];
    self.goodsName.text = model.title;
    self.currentPrice.text = model.subTitle;

}
-(void)layoutSubviews
{
    [super layoutSubviews];

}
@end
