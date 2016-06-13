//
//  AJScrollerPageView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/6/8.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AJScrollerPageView : UIView

@property (nonatomic, copy) ClikedCallback clikeCall;
+ (instancetype)pageScroller:(NSArray <NSString *>*)images placeHolderImage:(UIImage *)placeHolderImage;

@end
