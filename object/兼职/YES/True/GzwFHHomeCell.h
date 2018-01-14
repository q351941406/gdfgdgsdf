//
//  FHHomeCell.h
//  work
//
//  Created by 林海 on 17/8/10.
//  Copyright © 2017年 pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GzwHomeModel;
@interface GzwFHHomeCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic,strong) GzwHomeModel *model;
@end
