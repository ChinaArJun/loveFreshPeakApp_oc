//
//  AJHeadLinePageView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/23.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"

@interface AJHeadLinePageView : UIView
@property (nonatomic, strong) ActInfo *headline;
@property (nonatomic, copy) ClikedCallback callback;
@end
