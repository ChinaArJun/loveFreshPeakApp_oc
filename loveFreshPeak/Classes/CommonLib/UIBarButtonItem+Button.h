//
//  UIBarButtonItem+Button.h
//  loveFreshPeak
//
//  Created by ArJun on 16/5/23.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ItemButtonType) {
    LeftItemButton,
    RightItemButton
};

@interface UIBarButtonItem (Button)

+ (instancetype)barButtonItem:(NSString *)title image:(NSString *)image target:(id)target action:(SEL)action type:(ItemButtonType)type;


@end
