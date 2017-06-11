//
//  GzwFlashSaleCell.m
//  pjh365
//
//  Created by 嗨购 on 16/5/23.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwFlashSaleCell.h"
#import "UIImageView+WebCache.h"
@interface GzwFlashSaleCell ()
/**
 *  商品图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
/**
 *  标题
 */
@property (weak, nonatomic) IBOutlet UILabel *title;
/**
 *  折扣率
 */
@property (weak, nonatomic) IBOutlet UILabel *rate;
/**
 *  剩余时间Lab
 */
@property (weak, nonatomic) IBOutlet UILabel *surplusTime;
@end
@implementation GzwFlashSaleCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.title.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}


#pragma mark Set
-(void)setModel:(NSDictionary *)model{

    _model = model;
    self.title.text = self.model[@"title"];
    NSArray *imgs = self.model[@"imageurls"];
    if (imgs.count > 0) {
        [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:self.model[@"imageurls"][0][@"url"]]];
    }
    
    self.surplusTime.text = self.model[@"pubDate"];
}









@end
