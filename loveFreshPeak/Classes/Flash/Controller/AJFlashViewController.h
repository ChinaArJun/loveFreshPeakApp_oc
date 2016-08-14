//
//  AJFlashViewController.h
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJSelectedAdressViewController.h"

@protocol AJFlashViewControllerDelegate <NSObject>

- (void)didTableView:(UITableView *)tableView clickIndexPath:(NSIndexPath *)indexPath;

@end

@interface AJFlashViewController : AJSelectedAdressViewController
@property (nonatomic, weak) id<AJFlashViewControllerDelegate>delegate;
@end
