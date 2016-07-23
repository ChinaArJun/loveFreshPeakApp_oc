//
//  AJHeadLinePageView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/7/23.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJHeadLinePageView.h"
#import "AJHeadlineContentView.h"

@interface AJHeadLinePageView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *headlineScrollView;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSTimer *timer;
@end
@implementation AJHeadLinePageView
/* 最大重用view的个数 */
static const CGFloat MaxContentViewCount = 3;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _headlineScrollView = [[UIScrollView alloc]init];
        _headlineScrollView.pagingEnabled = YES;
        _headlineScrollView.bounces = NO;
        _headlineScrollView.delegate = self;
        _headlineScrollView.showsVerticalScrollIndicator = NO;
        _headlineScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_headlineScrollView];
        
        for (int i = 0; i < MaxContentViewCount; ++i) {
            AJHeadlineContentView *contentView = [[AJHeadlineContentView alloc]init];
            contentView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(contentViewClicked:)];
            [contentView addGestureRecognizer:tap];
            [_headlineScrollView addSubview:contentView];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.headlineScrollView.frame = self.bounds;
    CGFloat scrollViewW = self.headlineScrollView.frame.size.width;
    CGFloat scrollViewH = self.headlineScrollView.frame.size.height;
    self.headlineScrollView.contentSize = CGSizeMake(scrollViewW, scrollViewH * MaxContentViewCount);
    for (NSInteger i = 0; i<MaxContentViewCount; i++) {
        AJHeadlineContentView *contentView = self.headlineScrollView.subviews[i];
        contentView.frame = CGRectMake(0, i * scrollViewH, scrollViewW, scrollViewH);
    }
}

- (void)updateHeadlinePageView{
    CGFloat scrollViewH = self.headlineScrollView.frame.size.height;
    for (int i = 0; i < MaxContentViewCount; ++i) {
        NSInteger index = self.currentPage;
        AJHeadlineContentView *contentView = self.headlineScrollView.subviews[i];
        if (i==0) {
            index--;
        }else if(i == 2){
            index++;
        }
        if (index < 0) {
            index = self.headline.act_rows.count - 1;
        }else if (index > self.headline.act_rows.count-1){
            index = 0;
        }
        contentView.tag = index;
        contentView.actRow = self.headline.act_rows[index];
    }
    self.headlineScrollView.contentOffset = CGPointMake(0, scrollViewH);
}

#pragma mark - ---| UIScrollViewDelegate |---

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i < MaxContentViewCount; ++i) {
        AJHeadlineContentView *contentView = self.headlineScrollView.subviews[i];
        CGFloat distance = fabs(contentView.frame.origin.y - self.headlineScrollView.contentOffset.y);
        if (distance < minDistance) {
            minDistance = distance;
            self.currentPage = contentView.tag;
        }
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateHeadlinePageView];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updateHeadlinePageView];
}
- (void)strarTimer{
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)stopTimer{
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)next{
    CGFloat scrollViewH = self.headlineScrollView.frame.size.height;
    
    [self.headlineScrollView setContentOffset:CGPointMake(0, 2 * scrollViewH) animated:YES];
}

- (void)setHeadline:(ActInfo *)headline{
    [self layoutIfNeeded];
    _headline = headline;
    self.currentPage = 0;
    [self stopTimer];
    [self strarTimer];
    [self updateHeadlinePageView];
}

- (void)contentViewClicked:(UITapGestureRecognizer *)tap{
    if (self.callback) {
        self.callback(HeadViewItemTypeHeadLine,tap.view.tag);
    }
}

@end
