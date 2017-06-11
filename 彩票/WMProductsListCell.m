//
//  WMProductsListCell.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/20.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMProductsListCell.h"
#import "OTSColor.h"
@interface WMProductsListCell()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end
@implementation WMProductsListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}

- (void)setStatus:(NumberModel *)model {
    BOOL isSelect = model.isSelect;
    self.numLabel.text = model.number;
        if (isSelect) {
            if ([model.blueColor  isEqual: @1]) {
                self.image.image = [UIImage imageNamed:@"ball_blue"];
            } else {
                self.image.image = [UIImage imageNamed:@"ball_red"];
            }
            self.numLabel.textColor = [UIColor whiteColor];
        } else {
            if ([model.blueColor isEqual:@1]) {
                self.numLabel.textColor = [OTSColor hex:@"0080FF"];
            } else {
                self.numLabel.textColor = [OTSColor paleRedColor];
            }
            self.image.image = [UIImage imageNamed:@"ball_gray"];
        }
}

@end
