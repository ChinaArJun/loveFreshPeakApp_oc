//
//  AJHomeViewController.m
//  loveFreshPeak
//
//  Created by Mianji.Gu on 16/5/21.
//  Copyright © 2016年 AJun. All rights reserved.
//

#import "AJHomeViewController.h"
#import "AJWebViewController.h"
#import "AJHomeHeadData.h"
#import "AJHomeHeadView.h"

@interface AJHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) AJHomeHeadData *homeHeadData;
@property (nonatomic, strong) AJHomeHeadView *homeheadView;
@end

@implementation AJHomeViewController

#pragma life sycle method
- (void)viewDidLoad{
    [super viewDidLoad];
    [self addNotification];
    [self buildCollectionView];
    [self buildTableHeadView];
}
- (void)addNotification{
    
}
- (void)buildCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 8;
    layout.minimumLineSpacing = 8;
    layout.sectionInset = UIEdgeInsetsMake(0, HomeCollectionViewCellMargin, 0, HomeCollectionViewCellMargin);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)buildTableHeadView{
    __weak typeof (self) weakSelf = self;
    [AJHomeHeadData loadHeadData:^(AJHomeHeadData *data, NSError *error) {
        weakSelf.homeHeadData = data;
        NSLog(@"data = %@",data);
        self.homeheadView = [[AJHomeHeadView alloc]initWithHeadData:data];
        self.homeheadView.callback = ^(HeadViewItemType type,NSInteger tag){
            [weakSelf showActityDetail:type tag:tag];
        };
        [self.view addSubview:self.homeheadView];
        NSLog(@"self.subviews = %@",self.view.subviews);
    }];
    
    [self.homeheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.top.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.height.equalTo(self.view.mas_width).multipliedBy(0.37);
    }];
}

- (void)showActityDetail:(HeadViewItemType)type tag:(NSInteger)tag{
    ActInfo *actInfo = self.homeHeadData.act_info[type];
    AJActivity *cativity = actInfo.act_rows[tag].activity;
    [self.navigationController pushViewController:[[AJWebViewController alloc]initWithActivity:cativity ] animated:YES];
    
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
//        return sel
    }else if (section==0){
        
    }
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return nil;
    
}




@end

