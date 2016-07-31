//
//  AJUserShopCarTool.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/30.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJUserShopCarTool.h"
#import "NSString+Extension.h"

@implementation AJUserShopCarTool

+ (instancetype)sharedInstance{
    static dispatch_once_t one;
    static AJUserShopCarTool *shopCarTool;
    dispatch_once(&one, ^{
        if (shopCarTool == nil) {
            shopCarTool = [[AJUserShopCarTool alloc]init];
        }
    });
    return shopCarTool;
}


- (NSMutableArray<AJGoods *> *)shopCar
{
    if (!_shopCar) {
        _shopCar = [NSMutableArray array];
    }
    return  _shopCar;
}

#pragma 添加商品
- (void)addSupermarkProductToShopCar:(AJGoods *)goods {
    
    
    for (AJGoods *obj in self.shopCar) {
        if (obj.gid == goods.gid) {
            return;
        }
    }
    [self.shopCar addObject:goods];
}
#pragma 删除商品
- (void)removeFromProductShopCar:(AJGoods*)goods {
    for (AJGoods *obj in self.shopCar) {
        if (goods.gid == obj.gid) {
            [self.shopCar removeObject:goods];
            [[NSNotificationCenter defaultCenter] postNotificationName:LFBShopCarDidRemoveProductNSNotification object:self userInfo:nil];
            return ;
        }
    }
}
#pragma 获取商品的数量
- (NSInteger)getShopCarGoodsNumber {
    __block NSInteger count = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(AJGoods * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        count += obj.userBuyNumber;
    }];
    return count;
}
#pragma 获取商品用价格
- (CGFloat)getShopCarGoodsPrice {
    __block CGFloat price = 0;
    [self.shopCar enumerateObjectsUsingBlock:^(AJGoods *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        price += [[obj.price cleanDecimalPointZear] doubleValue] * obj.userBuyNumber;
    }];
    return price;
}
- (BOOL)isEmpty {
    return self.shopCar.count == 0;
}


@end
