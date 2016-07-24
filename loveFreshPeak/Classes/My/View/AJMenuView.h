//
//  AJMenuView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/7/24.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJTitleIconAction.h"

@interface AJMenuView : UIView

- (instancetype)initMenu:(NSArray <AJTitleIconAction *>*)mens WithLine:(BOOL)line;

@end
