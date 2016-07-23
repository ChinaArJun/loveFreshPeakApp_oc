//
//  AJTitleIconAction.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJTitleIconAction.h"

@implementation AJTitleIconAction
+ (instancetype)titleIconWith:(NSString *)title icon:(UIImage *)image controller:(UIViewController *)controlller tag:(NSInteger )tag{
    AJTitleIconAction *titleIconAction = [[AJTitleIconAction alloc]init];
    titleIconAction.title = title;
    titleIconAction.icon = image;
    titleIconAction.controller = controlller;
    titleIconAction.tag = tag;
    return titleIconAction;
}
@end
