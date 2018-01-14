//
//  JianZhiDetailController.h
//  JianGuo
//
//  Created by apple on 16/3/15.
//  Copyright © 2016年 ningcol. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JianzhiModel;
#import "GzwObject.h"
@interface JianZhiDetailController : UIViewController


@property (nonatomic,copy) NSAttributedString *sendCount;

@property (nonatomic,copy) NSString *jobId;

@property (nonatomic,copy) NSString *merchantId;

@property (nonatomic,copy) NSString *loginId;

@property (nonatomic,strong) JianzhiModel *jzModel;
@property (nonatomic,strong) GzwObject *model;
@property(nonatomic,assign)BOOL hidden;

@end
