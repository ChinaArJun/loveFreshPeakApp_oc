//
//  AJFlashCell.m
//  loveFreshPeak
//
//  Created by ArJun on 16/8/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJFlashCell.h"

@interface AJFlashCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIView *yellowView;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation AJFlashCell
static NSString *flashCell = @"flashCell";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.highlightedTextColor = [UIColor blackColor];
        _backImageView = [[UIImageView alloc]init];
        _backImageView.image = [UIImage imageNamed:@"llll"];
        _backImageView.highlightedImage = [UIImage imageNamed:@"kkkkkkk"];
        _yellowView = [[UIView alloc]init];
        _yellowView.backgroundColor = [UIColor orangeColor];
        _yellowView.hidden = YES;
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        _lineView.alpha = 0.3;

        [self addSubview:_backImageView];
        [self addSubview:_yellowView];
        [self addSubview:_lineView];
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.height.equalTo(self).multipliedBy(0.8);
            make.width.equalTo(@5);
            make.centerY.equalTo(self);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.width.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    _yellowView.hidden = !selected;
    _titleLabel.highlighted = selected;
    _backImageView.highlighted = selected;
}

+ (instancetype)cellWithTable:(UITableView *)tableView{
    AJFlashCell *cell = [tableView dequeueReusableCellWithIdentifier:flashCell];
    if (!cell) {
        cell = [[AJFlashCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flashCell];
    }
    return cell;
}


- (void)setCategoryData:(ProductCategory *)categoryData{
    _categoryData = categoryData;
    self.titleLabel.text = categoryData.name;
}

@end
