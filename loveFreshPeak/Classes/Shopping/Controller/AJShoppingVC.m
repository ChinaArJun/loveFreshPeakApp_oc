//
//  AJShoppingVC.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJShoppingVC.h"
#import "AJDefaultView.h"
#import "AJShoppingCell.h"
#import "AJUserShopCarTool.h"
#import "AJTableFootView.h"
#import "AJAddressView.h"
#import "AJLightningView.h"

@interface AJShoppingVC ()<UITableViewDelegate,UITableViewDataSource,AJTableFootViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AJDefaultView *defaultView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) AJTableFootView *footView;

@end
@implementation AJShoppingVC
- (void)dealloc{
    [AJNotification removeObserver:self];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"购物车";
    [self bulidNotifacation];
    [self bulidTableView];
    [self bulidDefaultView];
}
- (void)bulidNotifacation{
    [AJNotification addObserver:self selector:@selector(IncreaseShoppingCart) name:LFBShopCarBuyNumberDidChangeNotification object:nil];
    [AJNotification addObserver:self selector:@selector(didRemoveGoods) name:LFBShopCarDidRemoveProductNSNotification object:nil];
    
}
- (void)IncreaseShoppingCart{
    self.footView.sumMoney = [[AJUserShopCarTool sharedInstance]getShopCarGoodsPrice];
}
- (void)didRemoveGoods{
    self.footView.sumMoney = [[AJUserShopCarTool sharedInstance]getShopCarGoodsPrice];
}
- (void)bulidTableView{
    self.tableView = ({
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.rowHeight = 80;
        //tableview.hidden = YES;
        tableview.backgroundColor = [UIColor clearColor];
        tableview;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self bulidTableHeadView];
    [self bulidTableFootView];
}
- (void)bulidTableHeadView{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 100)];
    AJAddressView *address = [[AJAddressView alloc]initWithFrame:CGRectMake(0, 10, Width, 50)];
    AJLightningView *lightning = [[AJLightningView alloc]initWithFrame:CGRectMake(0, 70, Width, 30)];
    [self.headView addSubview:address];
    [self.headView addSubview:lightning];
    self.tableView.tableHeaderView = self.headView;
}
- (void)bulidTableFootView{
    _footView = [[AJTableFootView alloc]initWithFrame:CGRectMake(0, 0, Width, 50)];
    _footView.delegate = self;
    self.tableView.tableFooterView = _footView;
}
- (void)bulidDefaultView{
    _defaultView = [[AJDefaultView alloc]init];
    _defaultView.hidden = YES;
    [self.view addSubview:_defaultView];
    [_defaultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(170);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([[AJUserShopCarTool sharedInstance]isEmpty]) {
        self.defaultView.hidden = NO;
        self.tableView.hidden = YES;
    }else{
        self.defaultView.hidden = YES;
        self.tableView.hidden = NO;
        __weak typeof (self) weakSelf = self;
        [SVProgressHUD showWithStatus:@"加载中"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.dataList = [AJUserShopCarTool sharedInstance].shopCar;
            weakSelf.footView.sumMoney = [[AJUserShopCarTool sharedInstance]getShopCarGoodsPrice];
            [weakSelf.tableView reloadData];
            [SVProgressHUD dismiss];
        });
    }
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ID";
    AJShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[AJShoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.goods = self.dataList[indexPath.row];
    return cell;
}

- (void)didTableFootViewCommit{
    UIViewController *moneyVc = [[UIViewController alloc]init];
    moneyVc.view.backgroundColor = [UIColor whiteColor];
    moneyVc.title = [NSString stringWithFormat:@"%.2lf",[[AJUserShopCarTool sharedInstance]getShopCarGoodsPrice]];
    [self.navigationController pushViewController:moneyVc animated:YES];
}

@end
