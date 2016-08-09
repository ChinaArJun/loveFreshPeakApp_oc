//
//  BaseTabBarViewController.h
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AJBaseNavigationController.h"

@interface BaseTabBarViewController : UITabBarController
/*
 * 是否隐藏tabBar
 */
@property (nonatomic, assign) BOOL tabBarHidden;

+(BaseTabBarViewController *)sharedController;

#pragma mark 是否隐藏tabBar
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

- (void)addChildVc:(NSArray *)childVcs
                    titles:(NSArray *)titles
                    images:(NSArray *)images
            selectedImages:(NSArray *)selectedImages
         tabBarNaviChildVC:(AJBaseNavigationController*)tabBarNaviChildVC;

@end
