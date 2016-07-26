//
//  AJHomeCellTitleView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/25.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeCellTitleView.h"
#import "UIColor+AJExpand.h"

@interface AJHomeCellTitleView ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *moreLable;
@end
@implementation AJHomeCellTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _lineView = [[UIView alloc]init];
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"优选水果";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel sizeToFit];
        _moreLable = [[UILabel alloc]init];
        _moreLable.font = [UIFont systemFontOfSize:12];
        _moreLable.textAlignment = NSTextAlignmentRight;
        _moreLable.text = @"更多 >";
        [_moreLable sizeToFit];
        [self addSubview:_lineView];
        [self addSubview:_titleLabel];
        [self addSubview:_moreLable];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(3);
            make.height.mas_equalTo(15);
            make.leading.equalTo(self).offset(10);
            make.centerY.equalTo(self);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_lineView);
            make.leading.equalTo(_lineView).offset(10);
            make.height.mas_equalTo(15);
        }];
        [_moreLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(10);
            make.centerY.equalTo(_lineView);
            make.height.mas_equalTo(15);
        }];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];

}
- (void)setActRow:(ActRow *)actRow{
    NSLog(@"_titleLabel.text = actRow.category_detail.name= %@",actRow.category_detail.name);
    NSLog(@"titleViewInfo.category_detail.category_color = %@",actRow.category_detail.category_color);
    UIColor *color = [UIColor getColor:actRow.category_detail.category_color];
    _lineView.backgroundColor = color;
    _titleLabel.textColor = color;
    _titleLabel.text = actRow.category_detail.name;
}
- (void)setTitleViewInfo:(ActRow *)titleViewInfo{

}

@end
