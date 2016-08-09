//
//  AJHomeCellGoodsView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJHomeHeadData.h"
#import "AJHomeCell.h"
@interface AJHomeCellGoodsView : UIView
@property (nonatomic, strong) ActRow *actRow;
@property (nonatomic, copy) ClikedCellback cellback;
@end
