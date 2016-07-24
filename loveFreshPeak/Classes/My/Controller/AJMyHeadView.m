//
//  AJMyHeadView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJMyHeadView.h"

@implementation AJMyHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
        UIButton *button = [[UIButton alloc]init];
        [button setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
        [self addSubview:button];
        
        UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"v2_my_avatar"]];
        [self addSubview:headImageView];
        
        UILabel *phoneLabel = [[UILabel alloc]init];
        phoneLabel.text = @"13265991050";
        phoneLabel.font = [UIFont systemFontOfSize:20];
        phoneLabel.textColor = [UIColor whiteColor];
        phoneLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:phoneLabel];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(5);
            make.width.and.height.mas_equalTo(50);
        }];
        
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).offset(-10);
            make.leading.mas_equalTo(10);
        }];
        
        [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headImageView);
            make.left.equalTo(headImageView.mas_right).offset(5);
            make.height.mas_equalTo(@30);
        }];
    }
    return self;
}
@end
