//
//  WMVenueCollectionViewCell.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/23.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMVenueCollectionViewCell.h"
@interface WMVenueCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *des;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation WMVenueCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = aData;
    [self.imageView setImage:[UIImage imageNamed:dic[@"image"]]];
    self.title.text = dic[@"title"];
    self.des.text = dic[@"des"];
    self.backgroundColor = [UIColor whiteColor];
    
}
@end
