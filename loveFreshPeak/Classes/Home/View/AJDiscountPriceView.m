//
//  AJDiscountPriceView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJDiscountPriceView.h"

@interface AJDiscountPriceView ()
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) UIView *lines;
@end

@implementation AJDiscountPriceView

- (instancetype)init{
    if (self = [super init]) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = [UIFont systemFontOfSize:13];
        _moneyLabel.textColor = [UIColor redColor];
        [self addSubview:_moneyLabel];
        
        _discountLabel = [[UILabel alloc]init];
        _discountLabel.font = [UIFont systemFontOfSize:12];
        _discountLabel.textColor = [UIColor grayColor];
        [self addSubview:_discountLabel];
        
        _lines = [[UIView alloc]init];
        _lines.backgroundColor = [UIColor grayColor];
        [self addSubview:_lines];
        
        [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(5);
            make.centerY.equalTo(self);
        }];
        [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_moneyLabel.mas_trailing).offset(1);
            make.centerY.equalTo(self);
        }];
        [_lines mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(_discountLabel);
            make.height.equalTo(@1);
            make.leading.equalTo(_discountLabel);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setGoods:(AJGoods *)goods{
    _goods = goods;
    self.moneyLabel.text = [NSString stringWithFormat:@"￥%@",goods.price];
    self.discountLabel.text = [NSString stringWithFormat:@"￥%@",goods.market_price];;
    [self.moneyLabel sizeToFit];
    [self.discountLabel sizeToFit];
    if ([goods.price isEqualToString:goods.market_price]) {
        self.discountLabel.hidden = YES;
        self.lines.hidden = YES;
    }else{
        self.discountLabel.hidden = NO;
        self.lines.hidden = NO;
    }
}

@end
