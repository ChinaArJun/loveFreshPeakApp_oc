//
//  AJHotView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/7.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJHotView : UIView
- (instancetype)initWithImages:(NSArray<NSString *> *)images title:(NSArray *)titles placeHolder:(UIImage *)image;
@property (nonatomic, copy) ClikedCallback callback;

@end
