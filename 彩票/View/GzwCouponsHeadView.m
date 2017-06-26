//
//  GzwFlashSaleHeadView.m
//  pjh365
//
//  Created by 嗨购 on 16/5/23.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwCouponsHeadView.h"
#import "SDCycleScrollView.h"
#import "GZWTool.h"
#import "Masonry.h"
#import "GzwThemeTool.h"
@interface GzwCouponsHeadView ()<SDCycleScrollViewDelegate>
/**
 *  黄金文字
 */
@property(nonatomic,strong)UIImageView *goldText;
/**
 *  title
 */
//@property(nonatomic,strong)UILabel *title;

@end
@implementation GzwCouponsHeadView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        // 网络加载 --- 创建带标题的图片轮播器
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ViewW, ViewW) delegate:nil placeholderImage:[UIImage imageNamed:@"unchecked"]];
        self.cycleScrollView.imageURLStringsGroup = @[@"http://www.zycpimg.com/img/banner/1496246400/1496975415112891725.jpg",@"http://www.zycpimg.com/img/banner/1496246400/1498440530683135919.jpg"];
        self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        self.cycleScrollView.pageDotColor = [GzwThemeTool pageColor];
        self.cycleScrollView.currentPageDotColor = [GzwThemeTool currentPageColor]; // 自定义分页控件小圆标颜色
        self.cycleScrollView.delegate = self;
        
        self.cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholderImage1080*380"];
//        self.cycleScrollView.imageURLStringsGroup = @[@"http://image.guesslive.com/mall/preview/201604/20160428100138_811.jpg"];
        
        
        self.goldText = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yiShengDaoDi"]];
        
//        self.title = [[UILabel alloc]init];
//        self.title.text = @"享得到的正品·猜不到的实惠";
//        self.title.font = [UIFont systemFontOfSize:16];
//        [self.title sizeToFit];
        
        
        [self addSubview:self.cycleScrollView];
//        [self addSubview:self.goldText];
//        [self addSubview:self.title];

        
    }
    return self;
}
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}
-(void)updateConstraints
{
    
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(self.width*0.35));
    }];
//    [self.goldText mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.equalTo(self.cycleScrollView.mas_bottom).offset(1);
//        make.left.equalTo(self.mas_left);
//        make.right.equalTo(self.mas_right);
//        make.height.equalTo(@(self.width*0.35*0.5));
//    }];
//    
//    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self)
//        make.top.equalTo(self.goldText.mas_bottom).offset(10);
//        make.centerX.equalTo(self);
//    }];

    [super updateConstraints];
}
#pragma SDCycleScrollViewDelegate
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    self.block(index);
//    [self.clickSubject sendNext:@(index)];
}
@end
