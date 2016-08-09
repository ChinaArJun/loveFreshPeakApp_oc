//
//  BaseTabBarButton.m
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "BaseTabBarButton.h"

@implementation BaseTabBarButton
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    return CGRectMake(0, 2, imageW, imageH);
}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * 0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
- (void)setHighlighted:(BOOL)highlighted{
    
}
@end
