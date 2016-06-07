
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

- (instancetype)initWithImages:(NSArray <NSString *>*)images titles:(NSArray *)titles placeHolder:(UIImage *)placeHolder{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < images.count; ++i) {
        AJIconImageTextView *iconImage = [AJIconImageTextView IconImageTextView:images[i] title:titles[i] placeHolder:placeHolder];
        iconImage.tag = i;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconImageClick:)];
        [iconImage addGestureRecognizer:tapGes];
        [self addSubview:iconImage];
        NSLog(@"i = %zd",i);
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    CGFloat iconW = (Width - 2*DefaultMargin) / 4;
    CGFloat iconH = iconW * 0.68 + 20;
    for (int i = 0; i < self.subviews.count; ++i) {
        AJIconImageTextView *iconImage = self.subviews[i];
        CGFloat iconX = (i % 4) * iconW + DefaultMargin;
        CGFloat iconY = (i /4) * iconH;
        iconImage.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    self.bounds = CGRectMake(0, 0, Width, (self.subviews.count / 4)*iconH);
}

- (void)iconImageClick:(UITapGestureRecognizer *)tapGes{
    if (self.clikedback) {
        self.clikedback(HeadViewItemTypeHot, tapGes.view.tag);
    }
}

@end
