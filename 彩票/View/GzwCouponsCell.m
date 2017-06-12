//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwCouponsCell.h"
#import "HomeM.h"

#import "GzwThemeTool.h"
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
}
#pragma mark Set
-(void)setModel:(HomeM *)model
{
    _model = model;
    
    
    
    self.goodsImage.image = [UIImage imageNamed:model.iconName];
    self.goodsName.text = model.title;
    self.currentPrice.text = model.subTitle;

}
-(void)layoutSubviews
{
    [super layoutSubviews];

}
@end
