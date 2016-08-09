//
//  AJHomeCategoryCell.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/25.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"
#import "AJHomeCellTitleView.h"
#import "AJHomeCellGoodsView.h"

@interface AJHomeCategoryCell : UICollectionViewCell
@property (nonatomic, strong) ActRow *cellInfo;
@property (nonatomic, copy) ClikedCellback cellback;

@end
