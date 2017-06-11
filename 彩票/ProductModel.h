//
//  ProductModel.h
//  MuseumWork
//
//  Created by 刘羽 on 17/3/25.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol NumberModel;

@interface NumberModel : JSONModel
@property (nonatomic) NSString *number;
@property (nonatomic) bool isSelect;
@property (nonatomic) NSNumber<Optional>* blueColor;
@end

@interface ProductModel : JSONModel
@property (nonatomic) NSString * title;
@property (nonatomic) NSArray <NumberModel> *numbers;
@end


