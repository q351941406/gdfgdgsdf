//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwAddressCell.h"


@interface GzwAddressCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *region;

@end
@implementation GzwAddressCell

- (void)awakeFromNib {
    // Initialization code
}
#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
//    self.name.text = [NSString stringWithFormat:@"%@  %@",model.name,model.phone];
//    self.region.text = model.address;
//    self.normalImage.hidden = ([model.isdefault intValue] == 1) ? NO : YES;
}

@end
