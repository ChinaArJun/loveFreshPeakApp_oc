//
//  AJFooterBannerData.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJActivity.h"

@interface AJFooterBannerData : NSObject
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSArray<AJActivity *> *data;
+ (void)loadFootBannerData:(CompleteBlock)comple;
@end
