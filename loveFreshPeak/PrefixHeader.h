//
//  PrefixHeader.h
//  loveFreshPeak
//
//  Created by ArJun on 16/5/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h

#import "AppConst.h"
#import "Masonry.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

typedef void (^CompleteBlock)(id data,NSError *error);
typedef NS_ENUM(NSInteger ,HeadViewItemType){
    HeadViewItemTypePage,
    HeadViewItemTypeHot,
    HeadViewItemTypeHeadLine,
    HeadViewItemTypeBrand,
    HeadViewItemTypeScene
};

typedef void(^ClikedCallback) (HeadViewItemType type,NSInteger tag);

#define Width  [[UIScreen mainScreen] bounds].size.width
#define Height [[UIScreen mainScreen] bounds].size.height

#define GrayColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1]


#endif /* PrefixHeader_h */
