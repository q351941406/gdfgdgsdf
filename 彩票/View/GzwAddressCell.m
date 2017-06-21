//
//  GzwOrderCell.m
//  跑腿
//
//  Created by mac on 15/9/27.
//  Copyright (c) 2015年 paotui. All rights reserved.
//

#import "GzwAddressCell.h"
#import "GzwThemeTool.h"
#import "GZWTool.h"
@interface GzwAddressCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UIView *decorationView;

@end
@implementation GzwAddressCell

- (void)awakeFromNib {
    self.decorationView.backgroundColor = [GzwThemeTool random];
    self.region.textColor = [GzwThemeTool subTitleTextTheme];
    self.name.textColor = [GzwThemeTool titleTextTheme];
    self.accessoryView.backgroundColor = [UIColor blackColor];
    self.backgroundColor = [GzwThemeTool cellBackgroudTheme];
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
#pragma mark Set
-(void)setModel:(NSDictionary *)model
{
    _model = model;
    
    
    
    if ([[model allKeys] containsObject:@"w_title_template"]){
        
        self.name.text = [self flattenHTML:model[@"w_title_template"] trimWhiteSpace:NO];
        self.region.text = [NSString stringWithFormat:@"%@%@期",model[@"w_lot_name"],model[@"w_expert"]];
        
    }else {
        self.name.text = [self flattenHTML:model[@"article_title"] trimWhiteSpace:NO];
        
        NSDate *currentTime = [NSDate dateWithTimeIntervalSince1970:[model[@"crt_time"] integerValue]/1000];
        
        NSString*string = [NSString stringWithFormat:@"%@",currentTime];

        self.region.text = [string substringToIndex:[string rangeOfString:@"+"].location];
    }
}
-(NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim
{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    }
    
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}
@end
