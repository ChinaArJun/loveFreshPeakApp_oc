//
//  UIColor+AJExpand.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/25.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "UIColor+AJExpand.h"

@implementation UIColor (AJExpand)
+ (UIColor *) getColor:(NSString *)hexColor{
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}

@end
