//
//  AJFooterBannerData.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJFooterBannerData.h"

@implementation AJFooterBannerData
+ (void)loadFootBannerData:(CompleteBlock)comple{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"footerBanner" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    AJFooterBannerData *footerData = [AJFooterBannerData mj_objectWithKeyValues:dict];
    comple(footerData.data,nil);
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"data": NSStringFromClass([AJActivity class])
             };
}
@end
