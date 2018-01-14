//
//  OTSColor.m
//  OneStoreFramework
//
//  Created by Aimy on 8/25/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import "OTSColor.h"

@interface OTSColor ()

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;

@end

@implementation OTSColor

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length
{
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)colorWithRGB:(NSUInteger)aRGB
{
    return [UIColor colorWithRed:((float)((aRGB & 0xFF0000) >> 16))/255.0 green:((float)((aRGB & 0xFF00) >> 8))/255.0 blue:((float)(aRGB & 0xFF))/255.0 alpha:1.0];
}

+ (UIColor *)hex:(NSString *)hexString
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch([colorString length])
    {
        case 3: // #RGB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:1];
            green = [self colorComponentFrom:colorString start:1 length:1];
            blue = [self colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start:0 length:1];
            red = [self colorComponentFrom:colorString start:1 length:1];
            green = [self colorComponentFrom:colorString start:2 length:1];
            blue = [self colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red = [self colorComponentFrom:colorString start:0 length:2];
            green = [self colorComponentFrom:colorString start:2 length:2];
            blue = [self colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start:0 length:2];
            red = [self colorComponentFrom:colorString start:2 length:2];
            green = [self colorComponentFrom:colorString start:4 length:2];
            blue = [self colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)bgColor
{
    return [ self colorWithRGB:0xeeeeee];
}

+ (UIColor *)gray
{
	return [self colorWithRGB:0x757575];
}

+ (UIColor *)lightGray
{
	return [self colorWithRGB:0xbdbdbd];
}

+(UIColor *)darkGray
{
	return [self colorWithRGB:0x212121];
}

+ (UIColor *)red
{
    return [self colorWithRGB:0xff3c25];
}

+ (UIColor *)blue
{
    return [self colorWithRGB:0x157efb];
}

+ (UIColor *)orange
{
    return [self colorWithRGB:0xff9800];
}

+ (UIColor *)green
{
	return [self colorWithRGB:0x97d054];
}

+ (UIColor *)darkRed
{
	return [self colorWithRGB:0xd32d21];
}

+(UIColor*)lightGreen{

    return [self colorWithRGB:0x6cae38];
}

+(UIColor*)Blue{

    return [self colorWithRGB:0x007ac5];
}

+(UIColor*)allWhite
{

    return [self colorWithRGB:0xFFFFFF];
}

+(UIColor*)allBlack
{

    return [self colorWithRGB:0x000000];
}

+(UIColor*)heightBlack
{
  
    return [self colorWithRGB:0x333333];
}

+(UIColor*)heightGray
{
 
    return [self colorWithRGB:0x666666];
}

+(UIColor*)theLightGray
{
 
    return [self colorWithRGB:0x999999];
}

+(UIColor*)theGrayColor
{

    return [self colorWithRGB:0xf1f1f1];
}

+(UIColor*)theBlueColor
{
    
    return [self colorWithRGB:0x00AEFC];
}

+(UIColor*)theOrangeColor
{
    
    return [self colorWithRGB:0xFF8A65];
}

+(UIColor*)lightGrayColor
{

    return [self colorWithRGB:0xf9f9f9];
}

+(UIColor*)paleRedColor
{

    return [self colorWithRGB:0xfd686c];
}

+(UIColor*)theLightBlack
{

    return [self colorWithRGB:0xe0e0e0];
}

/**
 *	我店红，擦擦
 *
 *	@return UIColor
 */
+(UIColor*)bgRed
{
    return [UIColor colorWithRed:220.0/255 green:0/255 blue:0/255 alpha:1];
}

/**
 *	我店字体灰，呵呵呵
 *
 *	@return UIColor
 */
+(UIColor*)textGray
{
    return [UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1];
}

+ (UIColor *)otsBlueColor
{
    return [self colorWithRGB:0x6890df];
}

+ (UIColor *)otsRedColor
{
    return [self colorWithRGB:0xdc0000];
}

+ (UIColor *)shopingOrangeColor
{
    return [self colorWithRGB:0xf63c2d];
}

+ (UIColor *)disableColor
{
    return [self colorWithRGB:0xa9a9a9];
}
@end

UIColor *rgb(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

UIColor *rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

UIColor *hex(NSInteger hex)
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0];
}

UIColor *shex(NSString* hexString)
{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch([colorString length])
    {
            case 2: // #grey
            alpha = 1.0f;
            red = [OTSColor colorComponentFrom:colorString start:0 length:2];
            green = [OTSColor colorComponentFrom:colorString start:0 length:2];
            blue = [OTSColor colorComponentFrom:colorString start:0 length:2];
            break;
            case 3: // #RGB
            alpha = 1.0f;
            red = [OTSColor colorComponentFrom:colorString start:0 length:1];
            green = [OTSColor colorComponentFrom:colorString start:1 length:1];
            blue = [OTSColor colorComponentFrom:colorString start:2 length:1];
            break;
            case 4: // #ARGB
            alpha = [OTSColor colorComponentFrom:colorString start:0 length:1];
            red = [OTSColor colorComponentFrom:colorString start:1 length:1];
            green = [OTSColor colorComponentFrom:colorString start:2 length:1];
            blue = [OTSColor colorComponentFrom:colorString start:3 length:1];
            break;
            case 6: // #RRGGBB
            alpha = 1.0f;
            red = [OTSColor colorComponentFrom:colorString start:0 length:2];
            green = [OTSColor colorComponentFrom:colorString start:2 length:2];
            blue = [OTSColor colorComponentFrom:colorString start:4 length:2];
            break;
            case 8: // #AARRGGBB
            alpha = [OTSColor colorComponentFrom:colorString start:0 length:2];
            red = [OTSColor colorComponentFrom:colorString start:2 length:2];
            green = [OTSColor colorComponentFrom:colorString start:4 length:2];
            blue = [OTSColor colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            return nil;
            break;
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

UIColor *rgbGrey(CGFloat grey)
{
    return [UIColor colorWithRed:grey/255.0 green:grey/255.0 blue:grey/255.0 alpha:1];
}

UIColor *rgbGreyA(CGFloat grey, CGFloat alpha)
{
    return [UIColor colorWithRed:grey/255.0 green:grey/255.0 blue:grey/255.0 alpha:alpha];
}
