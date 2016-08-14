//
//  AJSelectedAdressViewController.m
//  loveFreshPeak
//
//  Created by ArJun on 16/5/23.
//  Copyright © 2016年 AJun. All rights reserved.
//  当前需要统一改变导航栏样式的控制器

#import "AJSelectedAdressViewController.h"
#import "UIBarButtonItem+Button.h"

@interface AJSelectedAdressViewController ()

@end

@implementation AJSelectedAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildNavigationBar
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItem:@"扫一扫" image:@"icon_black_scancode" target:self action:@selector(LeftItemButtonClicket) type:LeftItemButton];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItem:@"搜索" image:@"icon_search" target:self action:@selector(rightBarButtonClick) type:RightItemButton];
    
    self.navigationController.navigationBar.barTintColor = GeneralColor;
}

/**
 *  将要显示进入控制器调用
 */
- (void)viewWillAppear:(BOOL)animated
{
    
}

#pragma callBack method
- (void)LeftItemButtonClicket{
    
}
- (void)rightBarButtonClick{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
