//
//  AJActivity.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/5.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJActivity.h"

@implementation HeadResource

+ (void)loadHeadData:(CompleteBlock)complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"首页焦点按钮" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    HeadResource *headResource = [HeadResource mj_objectWithKeyValues:json];
    complete(headResource.data,nil);
}

@end

@implementation HeadData

+ (NSDictionary *)mj_objectClassInArray {
    return  @{
              @"focus":NSStringFromClass([AJActivity class]),
              @"activities":NSStringFromClass([AJActivity class]),
              @"icons":NSStringFromClass([AJActivity class])
              };
}



@end

@implementation AJActivity
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"aid":@"id"};
}
@end

@implementation ExtParams

@end
