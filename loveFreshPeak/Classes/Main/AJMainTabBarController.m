//
//  AJMainTabBarController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJBaseNavigationController.h"
#import "AJMainTabBarController.h"
#import "AJHomeViewController.h"
#import "AJFlashViewController.h"
#import "AJMyViewController.h"
#import "AJUserShopCarTool.h"
#import "AJShoppingVC.h"

@implementation AJMainTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addMainTabBarController];
    [self addNotification];
}



- (void)addMainTabBarController
{
    
    
    [self setupChildViewController:@"首页" viewController:[AJHomeViewController new] image:@"v2_home" selectedImage:@"v2_home_r"];
    [self setupChildViewController:@"闪电超市" viewController:[AJFlashViewController new] image:@"v2_order" selectedImage:@"v2_order_r"];
    [self setupChildViewController:@"购物车" viewController:[AJShoppingVC new] image:@"shopCart" selectedImage:@"shopCart_r"];
    [self setupChildViewController:@"我的" viewController:[AJMyViewController new] image:@"v2_my" selectedImage:@"v2_my_r"];
    
}
- (void)addNotification{
    [AJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
}
- (void)IncreaseShoppingCart{
    UIViewController *shoppingVC = self.childViewControllers[2];
    NSInteger shoppingIndex = [[AJUserShopCarTool sharedInstance]getShopCarGoodsNumber];
    if (shoppingIndex == 0) {
        shoppingVC.tabBarItem.badgeValue = nil;
        return;
    }
    shoppingVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",shoppingIndex];
}
- (void)dealloc{
    [AJNotification removeObserver:self];
}

- (void)setupChildViewController:(NSString *)title viewController:(UIViewController *)controller image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UITabBarItem *item = [[UITabBarItem alloc]init];
    item.image = [UIImage imageNamed:image];
    item.selectedImage = [UIImage imageNamed:selectedImage];
    item.title = title;
    controller.tabBarItem = item;
    controller.title = title;
    AJBaseNavigationController *naController = [[AJBaseNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:naController];
}

@end
