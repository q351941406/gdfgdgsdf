//
//  GzwHeadSelectTool.h
//  功能机
//
//  Created by sky33 on 16/3/3.
//  Copyright © 2016年 action. All rights reserved.
//  相册图片选择工具

#import <Foundation/Foundation.h>
@import UIKit;
@protocol headSelectToolDelegate <NSObject>
-(void)didSelect:(UIImage *)image;
@end
@interface GzwHeadSelectTool : NSObject
@property(nonatomic,weak) id <headSelectToolDelegate> delegate;
/**
 *  指定图片大小
 */
@property(nonatomic,assign)CGSize size;
//-(void)show;
-(void)showVC:(UIViewController *)vc WithBlock:(void (^)(UIImage *image))block;
@end
