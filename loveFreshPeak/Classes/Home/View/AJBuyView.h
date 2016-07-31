//
//  AJBuyView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/29.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJGoods.h"

@interface AJBuyView : UIView
/*
 * 是否显示0
 */
@property (nonatomic, assign) BOOL zearIsShow;
/*
 * 关联的商品模型
 */
@property (nonatomic, strong) AJGoods *goods;
/*
 * 不显示减号
 */
@property (nonatomic, assign) BOOL zearNeverShow;

@end
