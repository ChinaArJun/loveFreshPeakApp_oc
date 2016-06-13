//
//  AJBaseNavigationController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJBaseNavigationController.h"

@interface AJBaseNavigationController ()
@property (nonatomic,strong) UIButton *backBtn;
@end

@implementation AJBaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.backBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"v2_goback"] forState:UIControlStateNormal];
        btn.titleLabel.hidden = YES;
        [btn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.contentHorizontalAlignment  = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        btn.frame = CGRectMake(0, 0, 44, 40);
        btn;
    });
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        viewController.hidesBottomBarWhenPushed = YES; 
    }
    [super pushViewController:viewController animated:animated];
}

- (void)backBtnClicked:(UIButton *)btn {
    [self popViewControllerAnimated:YES];
}

@end
