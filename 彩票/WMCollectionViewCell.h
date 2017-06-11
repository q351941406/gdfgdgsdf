//
//  WMCollectionViewCell.h
//  MuseumWork
//
//  Created by iosDevelop on 17/3/23.
//  Copyright © 2017年 tonywang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMCollectionViewCell : UICollectionViewCell

/**
 *  功能:获取cell的唯一标识符
 */
+ (NSString *)cellReuseIdentifier;
/**
 *  功能:获取cell对应的xib
 */
+ (UINib *)nib;

/**
 *	功能:cell根据数据显示ui
 *
 *	@param aData cell数据
 */
- (void)updateWithCellData:(id)aData;

/**
 *	功能:cell根据数据和位置显示ui
 *
 *	@param aData cell数据
 *	@param indexPath cell位置
 */
- (void)updateWithCellData:(id)aData atIndexPath:(NSIndexPath *)indexPath;
@end
