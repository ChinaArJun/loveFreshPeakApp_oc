//
//  AJHomeHeadView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "AJHomeHeadData.h"
#import "AJScrollerPageView.h"
#import "AJHeadLineView.h"
#import "AJHotView.h"

@interface AJHomeHeadView : UIView
@property (nonatomic, strong) AJScrollerPageView *scrollerView;
@property (nonatomic, strong) AJHotView *hotView;
@property (nonatomic, strong) AJHeadLineView *headlineView;
@property (nonatomic, assign) CGFloat height;

- (instancetype)initWithHeadData:(AJHomeHeadData *)headData;
@property (nonatomic, copy) ClikedCallback callback;



@end
