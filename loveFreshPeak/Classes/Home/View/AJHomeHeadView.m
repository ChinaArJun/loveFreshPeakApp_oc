//
//  AJHomeHeadView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeHeadView.h"

@implementation AJHomeHeadView
- (instancetype)initWithHeadData:(AJHomeHeadData *)headData{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSMutableArray *focusImages = [NSMutableArray array];
    NSMutableArray *iconImages = [NSMutableArray array];
    NSMutableArray *iconTitles = [NSMutableArray array];
    
    [headData.focus.act_rows enumerateObjectsUsingBlock:^(ActRow *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [focusImages addObject:obj.activity.img];
    }];
    
    [headData.icon.act_rows enumerateObjectsUsingBlock:^(ActRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [iconImages addObject:obj.activity.img];
        [iconTitles addObject:obj.activity.name];
    }];
    NSLog(@"iconImages = %@ headData.focus.act_rows= %@",iconImages,headData.focus.act_rows);
    _hotView = [[AJHotView alloc]initWithImages:iconImages titles:iconTitles placeHolder:[UIImage imageNamed:@"v2_placeholder_full_size"]];
    
    [self addSubview:_hotView];
    
    [_hotView layoutIfNeeded];
    
    [_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.top.equalTo(self);
        make.trailing.equalTo(self);
        make.height.equalTo(self.mas_width).multipliedBy(0.37);
    }];
    
    
    
    
    return self;
}

- (void)setCallback:(ClikedCallback)callback{
    self.hotView.clikedback = callback;
}

@end
