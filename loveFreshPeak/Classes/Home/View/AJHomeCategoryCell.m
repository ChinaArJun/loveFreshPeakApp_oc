//
//  AJHomeCategoryCell.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/25.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHomeCategoryCell.h"
#import "AJHomeCellTitleView.h"

@interface AJHomeCategoryCell ()
@property (nonatomic, strong) AJHomeCellTitleView *titleView;
@end

@implementation AJHomeCategoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _titleView = [[AJHomeCellTitleView alloc]init];
        [self addSubview:_titleView];
        
        
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self);
            make.height.mas_offset(30);
        }];
    }
    return self;
}


- (void)setCellInfo:(ActRow *)cellInfo{
    NSLog(@"actRow.activity.img = %@  --= %@",cellInfo.activity.img,cellInfo.category_detail.name);
    self.titleView.actRow = cellInfo;
    
}

@end
