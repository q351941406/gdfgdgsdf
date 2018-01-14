//
//  OTSSize.h
//  OneStoreFramework
//
//  Created by Aimy on 14/11/30.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum OTSSizeType
{
    OTSSizeTypeNone = 0,
    OTSSizeType3_5,
    OTSSizeType4_0,
    OTSSizeType4_7,
    OTSSizeType5_5,
    OTSSizeType9_7,
    OTSSizeType9_7_LAND,
} OTSSizeType;

#define ISIPHONE3_5  CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size)
#define ISIPHONE4_0  CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size)
#define ISIPHONE4_7  CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size)
#define ISIPHONE5_5  CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size)
#define ISIPHONE9_7  CGSizeEqualToSize(CGSizeMake(768, 1024), [[UIScreen mainScreen] bounds].size)
#define ISIPHONE9_7_LAND  CGSizeEqualToSize(CGSizeMake(1024, 768), [[UIScreen mainScreen] bounds].size)

#define OTSScaledLength(lengthValue) [OTSSize getLengthWithSizeType:OTSSizeType4_7 andLength:(lengthValue)]

#define Width  [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height


// 单例
#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once(&once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}


@interface OTSSize : NSObject

+ (CGFloat)getLengthWithSizeType:(OTSSizeType)sizeType andLength:(CGFloat)length;

+ (CGFloat)getRatioLengthWithSizeType:(OTSSizeType)sizeType andLength:(CGFloat)length;

@end

#define OTS_RATIO_LENGTH(length) isPhone() ? OTS_PHONE_RATIO_LENGTH(length) : OTS_PAD_RATIO_LENGTH(length)
#define OTS_PHONE_RATIO_LENGTH(length) [OTSSize getLengthWithSizeType:OTSSizeType4_7 andLength:length]
#define OTS_PAD_RATIO_LENGTH(length) [OTSSize getLengthWithSizeType:OTSSizeType9_7 andLength:length]
