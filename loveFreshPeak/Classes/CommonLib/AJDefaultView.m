//
//  AJDefaultView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/8/14.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJDefaultView.h"

@implementation AJDefaultView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"v2_shop_empty"];
        imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:imageView];
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.text = @"亲,购物车空空的耶~赶紧挑好吃的吧";
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        [self addSubview:titleLabel];
        UIButton *button = [[UIButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:@"btn.png"] forState:UIControlStateNormal];
        [button setTitle:@"去逛逛" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:100/255.0 green:100/255.0  blue:100/255.0  alpha:1.0] forState:UIControlStateNormal];
        [self addSubview:button];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
        }];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.top.equalTo(imageView.mas_bottom);
            make.height.mas_equalTo(50);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleLabel.mas_bottom);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(150);
        }];
    }
    return self;
}

@end
