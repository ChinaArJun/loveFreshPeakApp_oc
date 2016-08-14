//
//  AJAddressView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/8/14.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJAddressView.h"

@interface AJAddressView ()
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIImageView *arrows;
@end

@implementation AJAddressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:15];
        _addressLabel.textColor = [UIColor redColor];
        _addressLabel.text = @"先锋侠需要你的精确坐标";
        [_addressLabel sizeToFit];
        [self addSubview:_addressLabel];
        
        _arrows = [[UIImageView alloc]init];
        _arrows.image = [UIImage imageNamed:@"icon_go"];
        [self addSubview:_arrows];
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

@end
