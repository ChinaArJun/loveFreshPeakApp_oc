//
//  ItemCustomButton.m
//  loveFreshPeak
//
//  Created by ArJun on 16/5/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "ItemCustomButton.h"

@implementation ItemCustomButton

@end

@implementation ItemLeftButton

/**
 *  重写设置frmas方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heith = self.frame.size.height;
    CGFloat offset = -20;
    self.titleLabel.frame = CGRectMake(offset, heith-15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heith-15);
    // 设置图片不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
}

@end

@implementation ItemRighButton

/**
 *  重写设置frmas方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heith = self.frame.size.height;
    CGFloat offset = 20;
    self.titleLabel.frame = CGRectMake(offset, heith-15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heith-15);
    // 设置图片不拉伸
    self.imageView.contentMode = UIViewContentModeCenter;
}


@end