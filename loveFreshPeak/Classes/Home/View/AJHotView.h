//
//  AJHotView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/7.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJHotView : UIView
- (instancetype)initWithImages:(NSArray <NSString *>*)images titles:(NSArray *)titles placeHolder:(UIImage *)placeHolder;
@property (nonatomic, copy) ClikedCallback clikedback;

@end
