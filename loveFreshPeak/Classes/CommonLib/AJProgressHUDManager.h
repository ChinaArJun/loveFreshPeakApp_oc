//
//  AJProgressHUDManager.h
//  loveFreshPeak
//
//  Created by ArJun on 16/8/14.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

@interface AJProgressHUDManager : SVProgressHUD

- (void)setBackgroundColor:(UIColor *)color;
- (void)showImage:(UIImage *)image string:(NSString *)string;
@end
