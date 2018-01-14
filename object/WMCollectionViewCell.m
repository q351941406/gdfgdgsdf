//
//  WMCollectionViewCell.m
//  MuseumWork
//
//  Created by iosDevelop on 17/3/23.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import "WMCollectionViewCell.h"

@implementation WMCollectionViewCell

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData
{
    
}

- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
