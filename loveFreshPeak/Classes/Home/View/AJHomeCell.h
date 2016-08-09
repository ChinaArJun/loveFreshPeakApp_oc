//
//  AJHomeCell.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJGoods.h"
typedef void(^ClikedCellback) (AJGoods *goods);

typedef enum : NSUInteger {
    AJHomeCellTypeVerticalScreen,
    AJHomeCellTypeCrossScreen
} AJHomeCellType;

@interface AJHomeCell : UICollectionViewCell
@property (nonatomic, strong) AJGoods *goods;
/*
 * 不显示减号
 */
@property (nonatomic, assign) BOOL zearNeverShow;
@property (nonatomic, copy) ClikedCellback cellback;
@end
