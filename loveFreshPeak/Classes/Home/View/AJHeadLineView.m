//
//  AJHeadLineView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/23.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHeadLineView.h"
#import "AJHeadLinePageView.h"

@interface AJHeadLineView ()
@property (nonatomic, strong) UIImageView *headlineImageView;
@property (nonatomic, strong) AJHeadLinePageView *pageView;
@end

@implementation AJHeadLineView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0].CGColor;
        self.layer.borderWidth = 1;
        _headlineImageView = [[UIImageView alloc]init];
        _headlineImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_headlineImageView];
        _pageView = [[AJHeadLinePageView alloc]init];
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        [self addSubview:line];
        [self addSubview:_pageView];
        [_headlineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(80);
            make.height.equalTo(self);
            make.leading.equalTo(self).offset(10);
            make.top.equalTo(self);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(5);
            make.leading.equalTo(_headlineImageView.mas_trailing).offset(5);
            make.bottom.equalTo(self).offset(-5);
            make.width.mas_equalTo(1);
        }];
        [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_headlineImageView.mas_trailing);
            make.top.equalTo(self);
            make.height.equalTo(self);
            make.trailing.equalTo(self);
        }];
    }
    return self;
}

- (void)setHeadline:(ActInfo *)headline{
    [self.headlineImageView sd_setImageWithURL:[NSURL URLWithString:headline.head_img] placeholderImage:[UIImage imageNamed:@"buyOne"]];
    self.pageView.headline = headline;
    NSLog(@"_headlineImageView.frame = %@",NSStringFromCGRect(_headlineImageView.frame));
}

- (void)setCallback:(ClikedCallback)callback{
    self.pageView.callback = callback;
}


@end
