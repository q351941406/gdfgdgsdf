//
//  GzwCouponsHeadView.h
//  pjh365
//
//  Created by 嗨购 on 16/5/24.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface GzwCouponsHeadView : UIView
/**
 *  头部图片轮播
 */
@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,copy) void (^block)(int index);
@end
