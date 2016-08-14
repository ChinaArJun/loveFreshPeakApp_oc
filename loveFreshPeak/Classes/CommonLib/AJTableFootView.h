//
//  AJTableFootView.h
//  loveFreshPeak
//
//  Created by ArJun on 16/8/14.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AJTableFootViewDelegate <NSObject>
- (void)didTableFootViewCommit;
@end

@interface AJTableFootView : UIView
@property (nonatomic, weak) id<AJTableFootViewDelegate>delegate ;
@property (nonatomic, assign) CGFloat sumMoney;
@end
