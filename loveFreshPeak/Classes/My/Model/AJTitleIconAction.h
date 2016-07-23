//
//  AJTitleIconAction.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AJTitleIconAction : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, assign) NSInteger tag;

+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controlller tag:(NSInteger )tag;
@end
