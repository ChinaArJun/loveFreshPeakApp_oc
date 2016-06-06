//
//  AJActivity.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/5.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ExtParams;

@interface AJActivity : NSObject

@property (nonatomic, copy) NSString *aid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *topimg;
@property (nonatomic, copy) NSString *jptype;
@property (nonatomic, copy) NSString *trackid;
@property (nonatomic, copy) NSString *minmg;
@property (nonatomic, strong) ExtParams *ext_params;

@end


@interface ExtParams : NSObject

@property (nonatomic, copy) NSString *cityid;
@property (nonatomic, copy) NSString *bigids;
@property (nonatomic, copy) NSString *activitygroup;

@end