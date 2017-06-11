//
//  WMProductsListVCData.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/24.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMProductsListVCData.h"

@implementation WMProductsListVCData
+ (WMProductsListVCData *)sharedInstance{
    static dispatch_once_t once;
    static WMProductsListVCData * __singleton__;
    dispatch_once(&once, ^{ __singleton__ = [[WMProductsListVCData alloc] init]; } );
    return __singleton__;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}
-(NSDictionary *)getDataWithTpye:(WMDataType)tpye{
    
    NSDictionary *dic = [NSDictionary dictionary];
    switch (tpye) {
        case WMDataTypeDaleTou:
            dic = @{@"section":@2,
                    @"title1":@"前区(至少选5个)",
                    @"row1":@35,
                    @"title2":@"后区(至少选2个)",
                    @"row2":@12
                    };
            break;
        case WMDataTypeShuangSeQiu:
            dic = @{@"section":@2,
                    @"title1":@"红球(至少选6个)",
                    @"row1":@33,
                    @"title2":@"篮球(至少选1个)",
                    @"row2":@16
                    };
            break;
        case WMDataType3D:
            dic = @{@"section":@3,
                    @"title1":@"百位(至少选1个)",
                    @"row1":@9,
                    @"title2":@"十位(至少选1个)",
                    @"row2":@9,
                    @"title3":@"个位(至少选1个)",
                    @"row3":@9
                    };
            break;
        case WMDataTypeQiCaiLe:
            dic = @{@"section":@1,
                    @"title1":@"至少选7个号码",
                    @"row1":@30
                    };
            break;
        case WMDataTypeQiXingCai:
            dic = @{@"section":@7,
                    @"title1":@"百万位(至少选1个)",
                    @"row1":@9,
                    @"title2":@"十万位(至少选1个)",
                    @"row2":@9,
                    @"title3":@"万位(至少选1个)",
                    @"row3":@9,
                    @"title4":@"千位(至少选1个)",
                    @"row4":@9,
                    @"title5":@"百位(至少选1个)",
                    @"row5":@9,
                    @"title6":@"十位(至少选1个)",
                    @"row6":@9,
                    @"title7":@"个位(至少选1个)",
                    @"row7":@9
                    };
            break;
        case WMDataTypePai3:
            dic = @{@"section":@3,
                    @"title1":@"百位(至少选1个)",
                    @"row1":@9,
                    @"title2":@"十位(至少选1个)",
                    @"row2":@9,
                    @"title3":@"个位(至少选1个)",
                    @"row3":@9
                    };
            break;
        case WMDataTypePai5:
            dic = @{@"section":@5,
                    @"title1":@"万位(至少选1个)",
                    @"row1":@9,
                    @"title2":@"千位(至少选1个)",
                    @"row2":@9,
                    @"title3":@"百位(至少选1个)",
                    @"row3":@9,
                    @"title4":@"十位(至少选1个)",
                    @"row4":@9,
                    @"title5":@"个位(至少选1个)",
                    @"row5":@9
                    };

            break;
        case WMDataType11DuoJing:
            
            break;
        case WMDataTypeJX11:
            
            break;
        case WMDataTypeXJ11:
            
            break;
        case WMDataTypeGD11:
            
            break;
            
        default:
            break;
    }
    return dic;

}
@end
