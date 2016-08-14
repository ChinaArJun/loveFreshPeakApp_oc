//
//  AJFlashViewController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJFlashViewController.h"
#import "AJProductsViewController.h"
#import "AJSupermarketSource.h"
#import "AJFlashCell.h"

@interface AJFlashViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *sortTableView;
@property (nonatomic, strong) AJProductsViewController *productsController;
@property (nonatomic, strong) SuperMarketData *supermarketSouce;
@end

@implementation AJFlashViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self bulidSortTableView];
    [self bulidProductsTableView];
    [self loadData];
}
- (void)bulidSortTableView{
    self.sortTableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 40;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
        tableView;
    });
    [self.view addSubview:self.sortTableView];
    [self.sortTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.25);
    }];
}
- (void)bulidProductsTableView{
    self.productsController = [[AJProductsViewController alloc]init];
    [self addChildViewController:self.productsController];
    [self.view addSubview:self.productsController.view];
    self.delegate = self.productsController;
    
}

- (void)loadData{
    __weak typeof (self) weak = self;
    [AJSupermarketSource loadSupermarketData:^(id data, NSError *error) {
        weak.supermarketSouce = data;
        [weak.sortTableView reloadData];
        [weak.sortTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        weak.productsController.supermarketSouce = data;
        NSLog(@"data = %@",data);
    }];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.supermarketSouce.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AJFlashCell *cell = [AJFlashCell cellWithTable:tableView];
    cell.categoryData = self.supermarketSouce.categories[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didTableView:clickIndexPath:)]) {
        [self.delegate didTableView:self.sortTableView clickIndexPath:indexPath];
    }
}



@end
