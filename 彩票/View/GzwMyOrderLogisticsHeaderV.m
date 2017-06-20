//
//  GzwGoodsDetailTopToolView.m
//  pjh365
//
//  Created by mac on 16/4/17.
//  Copyright © 2016年 bigkoo. All rights reserved.
//

#import "GzwMyOrderLogisticsHeaderV.h"
#import "UIImageView+WebCache.h"
#import "PNChart.h"
#import "GZWTool.h"
@interface GzwMyOrderLogisticsHeaderV ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *fans;
@property (weak, nonatomic) IBOutlet UIButton *attention;

@property (weak, nonatomic) IBOutlet UILabel *detaill;

@property (weak, nonatomic) IBOutlet UIView *circle1;
@property (weak, nonatomic) IBOutlet UILabel *circle1Text;
@property (weak, nonatomic) IBOutlet UIView *circle2;
@property (weak, nonatomic) IBOutlet UILabel *circle2Text;
@property (weak, nonatomic) IBOutlet UIView *circle3;
@property (weak, nonatomic) IBOutlet UILabel *circle3Text;
@property (weak, nonatomic) IBOutlet UIView *circle4;
@property (weak, nonatomic) IBOutlet UILabel *circle4Text;
@property (weak, nonatomic) IBOutlet UIView *circle5;
@property (weak, nonatomic) IBOutlet UILabel *circle5Text;
@property (weak, nonatomic) IBOutlet UIView *circle6;
@property (weak, nonatomic) IBOutlet UILabel *circle6Text;


@end
@implementation GzwMyOrderLogisticsHeaderV
#pragma mark Life Cycle
-(void)awakeFromNib
{
        self.logo.layer.cornerRadius = 20;
        self.logo.layer.masksToBounds = YES;
}
+(instancetype)myOrderLogisticsHeaderV
{
    GzwMyOrderLogisticsHeaderV *V = [[[NSBundle mainBundle] loadNibNamed:@"GzwMyOrderLogisticsHeaderV" owner:nil options:nil] lastObject];
    return V;
}

#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
    [self layoutIfNeeded];
    
    NSDictionary *dict = model[@"figure"];
    [self.logo sd_setImageWithURL:[NSURL URLWithString:dict[@"avatar"]]];
    self.name.text = [NSString stringWithFormat:@"%@ | %@",dict[@"name"],dict[@"masterLevel"]];
    self.fans.text = [NSString stringWithFormat:@"粉丝：%@",dict[@"fansCount"]];
    self.detaill.text = [NSString stringWithFormat:@"简介：%@",dict[@"bio"]];
    
    NSArray *a = model[@"rate"];
    [self.circle1 addSubview:[self setup:@100 to:a[0][@"data"]]];
    self.circle1Text.text = a[0][@"nameText"];
    
    [self.circle2 addSubview:[self setup:@100 to:a[1][@"data"]]];
    self.circle2Text.text = a[1][@"nameText"];
    
    [self.circle3 addSubview:[self setup:@100 to:a[2][@"data"]]];
    self.circle3Text.text = a[2][@"nameText"];
    
    [self.circle4 addSubview:[self setup:@100 to:a[3][@"data"]]];
    self.circle4Text.text = a[3][@"nameText"];
    
    [self.circle5 addSubview:[self setup:@100 to:a[4][@"data"]]];
    self.circle5Text.text = a[4][@"nameText"];
    
    [self.circle6 addSubview:[self setup:@100 to:a[5][@"data"]]];
    self.circle6Text.text = a[5][@"nameText"];

}
-(PNCircleChart *)setup:(NSNumber *)total to:(NSNumber *)current
{
    PNCircleChart *circle1 = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 0, ViewW/3,self.circle1.height)
                                                            total:total
                                                          current:current
                                                        clockwise:YES];
//    circle1.backgroundColor = [UIColor whiteColor];
//    circle1.countingLabel.textColor = [UIColor whiteColor];
//    [circle1 setStrokeColor:[UIColor clearColor]];
    [circle1 setStrokeColorGradientStart:[UIColor blueColor]];
    [circle1 strokeChart];
    return circle1;
}
@end
