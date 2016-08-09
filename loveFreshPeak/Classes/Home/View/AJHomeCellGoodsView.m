//
//  AJHomeCellGoodsView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeCellGoodsView.h"


#define maxCount 3
@implementation AJHomeCellGoodsView

- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        for (int i = 0; i < maxCount; ++i) {
            AJHomeCell *homeCell = [[AJHomeCell alloc]init];
            homeCell.layer.borderWidth = 0.5;
            homeCell.layer.borderColor = GrayColor.CGColor;
            [self addSubview:homeCell];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat cellHeight = self.frame.size.height;
    CGFloat cellWidth = self.frame.size.width / 3;
    CGFloat index = 0;
    for (AJHomeCell *cell in self.subviews) {
        cell.frame = CGRectMake(cellWidth * index, 0, cellWidth, cellHeight);
        index ++;
    }
}

- (void)setActRow:(ActRow *)actRow{
    for (int i = 0; i < self.subviews.count; ++i) {
        // 设置数据
        AJHomeCell *cell = self.subviews[i];
        cell.zearNeverShow = YES;
        cell.goods = actRow.category_detail.goods[i];
        
    }
}
- (void)setCellback:(ClikedCellback)cellback{
    _cellback = cellback;
    for (int i = 0; i < self.subviews.count; ++i) {
        // 设置数据
        AJHomeCell *cell = self.subviews[i];
        cell.cellback = cellback;
    }
}


@end
