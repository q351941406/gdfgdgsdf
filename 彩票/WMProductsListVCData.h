//
//  WMProductsListVCData.h
//  MuseumWork
//
//  Created by iosDevelop on 17/3/24.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum WMDataType
{
    WMDataTypeDaleTou = 0,
    WMDataTypeShuangSeQiu,
    WMDataType3D,
    WMDataTypeQiCaiLe,
    WMDataTypeQiXingCai,
    WMDataTypePai3,
    WMDataTypePai5,
    WMDataType11DuoJing,
    WMDataTypeJX11,
    WMDataTypeXJ11,
    WMDataTypeGD11
} WMDataType;

@interface WMProductsListVCData : NSObject
+ (WMProductsListVCData *)sharedInstance;
@end
