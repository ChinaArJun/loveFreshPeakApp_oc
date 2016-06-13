
//
//  AJHotView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/7.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHotView.h"
#import "AJIconImageTextView.h"

@implementation AJHotView

- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image {
    
    self = [super init];
    if (!self ) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i<images.count; i++) {
        AJIconImageTextView *iconView = [AJIconImageTextView IconImageTextView:images[i] title:titles[i] placeHolder:image];
        iconView.tag = i;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicked:)];
        NSLog(@"iconView = %@",iconView);
        [iconView addGestureRecognizer:tap];
        NSLog(@"i = %zd",i);
        [self addSubview:iconView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconW = (Width - 2 * DefaultMargin) / 4;
    CGFloat iconH = iconW * 0.68 + 20;
    for (NSInteger i = 0; i<self.subviews.count; i++) {
        AJIconImageTextView *iconView = self.subviews[i];
        NSLog(@"iconView = %@",iconView);
        CGFloat iconX = (i % 4) * iconW + DefaultMargin;
        CGFloat iconY = (i / 4) * iconH;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    
    self.bounds = CGRectMake(0, 0, Width, (self.subviews.count / 4) * iconH);
}

- (void)clicked:(UITapGestureRecognizer *)tap {
    if (self.callback) {
        self.callback(HeadViewItemTypeHot,tap.view.tag);
    }
}

@end
