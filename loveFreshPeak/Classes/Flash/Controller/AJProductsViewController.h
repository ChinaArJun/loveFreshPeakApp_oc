//
//  AJProductsViewController.h
//  loveFreshPeak
//
//  Created by ArJun on 16/8/3.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJBaseViewController.h"
#import "AJSupermarketSource.h"
#import "AJFlashViewController.h"

@interface AJProductsViewController : AJBaseViewController<AJFlashViewControllerDelegate>
@property (nonatomic, strong) SuperMarketData *supermarketSouce;
@end
