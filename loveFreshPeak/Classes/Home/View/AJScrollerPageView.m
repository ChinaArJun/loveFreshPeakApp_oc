//
//  AJScrollerPageView.m
//  loveFreshPeak
//
//  Created by ArJun on 16/6/8.
//  Copyright © 2016年 阿俊. All rights reserved.
//

#import "AJScrollerPageView.h"
/** 循环利用的imageview的个数  */
static const NSInteger MaxImageViewCount = 3;
@interface AJScrollerPageView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIImage *placeImage;
@end

@implementation AJScrollerPageView

+ (instancetype)pageScroller:(NSArray <NSString *>*)images placeHolderImage:(UIImage *)placeHolderImage{
    AJScrollerPageView *pageView = [[self alloc]init];
    pageView.images = images;
    pageView.placeImage = placeHolderImage;
    
    return pageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = ({
            UIScrollView *scroll = [[UIScrollView alloc]init];
            scroll.showsHorizontalScrollIndicator = NO;
            scroll.showsVerticalScrollIndicator = NO;
            scroll.pagingEnabled = YES;
            scroll.bounces = NO;
            scroll.delegate = self;
            scroll;
        });
        [self addSubview:self.scrollView];
        NSLog(@"self.images.count  - %zd",self.images.count);
        for (int i = 0; i <  MaxImageViewCount; ++i) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClick:)];
            [imageView addGestureRecognizer:tapGes];
            [self.scrollView addSubview:imageView];
        }
        NSLog(@"self.subvies = %@",self.scrollView.subviews);
        
        self.pageControl = [[UIPageControl alloc]init];
        self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_home_cycle_dot_selected"]];
        self.pageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"v2_home_cycle_dot_normal"]];
        [self addSubview:self.pageControl];
        
    }
    return self;
}

- (void)setImages:(NSArray *)images{
    _images = images;
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = images.count;
    
    [self stopTimer];
    [self starTimer];
    [self updatePageScrollerView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    self.scrollView.contentSize = CGSizeMake(scrollViewW * MaxImageViewCount, 0);
    for (int i = 0; i < self.scrollView.subviews.count; ++i) {
        UIImageView *images = self.scrollView.subviews[i];
        images.frame = CGRectMake(scrollViewW * i, 0, scrollViewW, scrollViewH);
    }
    self.pageControl.frame = CGRectMake(scrollViewW - 80, scrollViewH - 20, 80, 20);
    [self updatePageScrollerView];
}
- (void)updatePageScrollerView{
    for (int i = 0; i < self.scrollView.subviews.count; ++i) {
        UIImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        if (i==0) {
            index --;
        }else if(i == 2){
            index ++;
        }
        
        if (index < 0) {
            index = self.pageControl.numberOfPages-1;
        }else if(index > self.pageControl.numberOfPages - 1){
            index = 0;
        }
        imageView.tag = index;
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.images[index]] placeholderImage:self.placeImage];
    }
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat minDistance = MAXFLOAT;
    NSInteger page = 0;
    for (NSInteger i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = fabs(self.scrollView.contentOffset.x - imageView.frame.origin.x);
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    self.pageControl.currentPage = page;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updatePageScrollerView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updatePageScrollerView];
}

- (void)stopTimer{
    if (self.timer != nil) {
        [self.timer  invalidate];
        self.timer = nil;
    }
}
- (void)starTimer{
    self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(next) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}

- (void)imageViewClick:(UITapGestureRecognizer *)tapGes{
    if (self.clikeCall) {
        self.clikeCall(HeadViewItemTypePage,tapGes.view.tag);
    }
}

- (void)next{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * 2, 0) animated:YES];
}



















@end
