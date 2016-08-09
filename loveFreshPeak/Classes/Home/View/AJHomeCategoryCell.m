//
//  AJHomeCategoryCell.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/25.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeCategoryCell.h"


@interface AJHomeCategoryCell ()
@property (nonatomic, strong) AJHomeCellTitleView *titleView;
@property (nonatomic, strong) UIImageView *sortImage;
@property (nonatomic, strong) AJHomeCellGoodsView *goodsView;
@end

@implementation AJHomeCategoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _titleView = [[AJHomeCellTitleView alloc]init];
        [self addSubview:_titleView];
        _sortImage = [[UIImageView alloc]init];
        [self addSubview:_sortImage];
        _goodsView = [[AJHomeCellGoodsView alloc]init];
        [self addSubview:_goodsView];
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.height.mas_offset(30);
        }];
        [_sortImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleView.mas_bottom);
            make.leading.equalTo(self).offset(10);
            make.trailing.equalTo(self).offset(-10);
            make.height.equalTo(@100);
        }];
        [_goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_sortImage.mas_bottom);
            make.leading.trailing.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}


- (void)setCellInfo:(ActRow *)cellInfo{
    NSLog(@"actRow.activity.img = %@  --= %@",cellInfo.activity.img,cellInfo.category_detail.name);
    self.titleView.actRow = cellInfo;
    self.goodsView.actRow = cellInfo;
    [self.sortImage sd_setImageWithURL:[NSURL URLWithString:cellInfo.activity.img] placeholderImage:[UIImage imageNamed:cellInfo.category_detail.name]];
}
- (void)setCellback:(ClikedCellback)cellback{
    _cellback = cellback;
    self.goodsView.cellback = cellback;
}
@end
