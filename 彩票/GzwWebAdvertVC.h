//
//  GzwWebAdvertVC.h
//  children
//
//  Created by sky33 on 15/12/8.
//  Copyright © 2015年 sky32. All rights reserved.
//  web广告控制器

#import <UIKit/UIKit.h>

@interface GzwWebAdvertVC : UIViewController

@property (nonatomic,strong) UIColor    *progressColor;// 进度条颜色

@property (nonatomic,copy  ) NSString   *webUrl;// 跳转地址
@property(nonatomic,assign,getter = isLoadAdvDesc)BOOL LoadadvDesc;// YES ＝ 加载HTML  or  NO ＝ URL

@end
