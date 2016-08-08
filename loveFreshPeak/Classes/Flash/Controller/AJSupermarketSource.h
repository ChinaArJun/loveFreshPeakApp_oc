//
//  AJSupermarketSource.h
//  loveFreshPeak
//
//  Created by ArJun on 16/8/3.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SuperMarketData;
@class Products;
@class ProductCategory;
@class AJGoods;

@interface AJSupermarketSource : NSObject

/** code  */
@property (nonatomic, copy) NSString *code;
/** msg  */
@property (nonatomic, copy) NSString *msg;
/** data  */
@property (nonatomic,strong)SuperMarketData *data;

+ (void)loadSupermarketData:(CompleteBlock)complete;
@end

@interface SuperMarketData : NSObject

@property (nonatomic,strong)NSArray<ProductCategory *> *categories;

@property (nonatomic,strong)id products;

@end

@interface ProductCategory : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, strong) NSArray <AJGoods *> *products;
@end
