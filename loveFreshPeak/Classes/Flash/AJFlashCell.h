//
//  AJFlashCell.h
//  loveFreshPeak
//
//  Created by ArJun on 16/8/4.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AJSupermarketSource.h"

@interface AJFlashCell : UITableViewCell

@property (nonatomic, strong) ProductCategory *categoryData;
+ (instancetype)cellWithTable:(UITableView *)tableView;
@end
