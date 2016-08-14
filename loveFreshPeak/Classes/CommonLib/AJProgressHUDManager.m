//
//  AJProgressHUDManager.m
//  loveFreshPeak
//
//  Created by ArJun on 16/8/14.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJProgressHUDManager.h"

@implementation AJProgressHUDManager
- (void)setBackgroundColor:(UIColor *)color{
    [SVProgressHUD setBackgroundColor:color];
}
- (void)showImage:(UIImage *)image string:(NSString *)string{
    [SVProgressHUD showImage:image status:string];
}
@end
