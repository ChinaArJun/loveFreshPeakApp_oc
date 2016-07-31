//
//  AJHomeHeadData.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AJActivity.h"
#import "AJGoods.h"
@class ActInfo;
@class ActRow;
@class HeadlineDetail;
@class CategoryDetail;

@interface AJHomeHeadData : NSObject
@property (nonatomic, copy) NSArray <ActInfo *> *act_info;

@property (nonatomic, strong) ActInfo *focus;
@property (nonatomic,strong) ActInfo *icon;
@property (nonatomic,strong) ActInfo *headline;
@property (nonatomic,strong) ActInfo *brand;
@property (nonatomic,strong) ActInfo *scene;
@property (nonatomic,strong) ActInfo *category;

+ (void)loadHeadData:(CompleteBlock)complete;
@end


@interface ActInfo : NSObject
@property (nonatomic,strong) NSString *sort;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *head_img;
@property (nonatomic, strong) NSArray <ActRow *> *act_rows;

@end

@interface ActRow : NSObject
@property (nonatomic,strong) AJActivity *activity;
@property (nonatomic,strong) HeadlineDetail *headline_detail;
@property (nonatomic,strong) CategoryDetail *category_detail;

@end

@interface HeadlineDetail : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *content;

@end

@interface CategoryDetail : NSObject
@property (nonatomic,strong) NSString *category_id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray<AJGoods *> *goods;
@property (nonatomic,strong) NSString *category_color;

@end