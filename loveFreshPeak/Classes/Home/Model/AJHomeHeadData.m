//
//  AJHomeHeadData.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeHeadData.h"


@implementation AJHomeHeadData

+ (void)loadHeadData:(CompleteBlock)complete{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"首页热卖" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    AJHomeHeadData *homeHeadData = [AJHomeHeadData mj_objectWithKeyValues:dict];
    homeHeadData.focus = homeHeadData.act_info[0];
    homeHeadData.icon = homeHeadData.act_info[1];
    homeHeadData.headline = homeHeadData.act_info[2];
    homeHeadData.brand = homeHeadData.act_info[3];
    homeHeadData.scene = homeHeadData.act_info[4];
    homeHeadData.category = homeHeadData.act_info[5];
    complete(homeHeadData,nil);

}

@end
