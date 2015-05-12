//
//  ViewController.m
//  YSMAutoScrollViewDemo
//
//  Created by ysmeng on 15/5/12.
//  Copyright (c) 2015年 广州七升网络科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QSAutoScrollView.h"

@interface ViewController () <QSAutoScrollViewDelegate>

@property (nonatomic,retain) NSMutableArray *dataSource;//!<数据源

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ///数据源
    self.dataSource = [NSMutableArray arrayWithObjects:@"first.jpg",@"second.jpg",@"three.jpg", nil];
    
    ///尺寸
    CGFloat deviceWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat deviceHeight = [UIScreen mainScreen].bounds.size.height;
    
    ///标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 20.0f, deviceWidth, 44.0f)];
    titleLabel.text = @"类广告自滚动";
    [self.view addSubview:titleLabel];
    
    ///加载滚动栏
    QSAutoScrollView *scrollView = [[QSAutoScrollView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, deviceWidth, deviceHeight - 64.0f) andDelegate:self andScrollDirectionType:aAutoScrollDirectionTypeRightToLeft andShowPageIndex:YES isAutoScroll:YES andShowTime:2.0f andTapCallBack:^(id params) {
        
        ///点击滚动页事件
        NSLog(@"点击滚动页:%@",params);
        
    }];
    [self.view addSubview:scrollView];
    
}

#pragma mark - 滚动栏设置
- (int)numberOfScrollPage:(QSAutoScrollView *)autoScrollView
{

    return (int)[self.dataSource count];

}

- (id)autoScrollViewTapCallBackParams:(QSAutoScrollView *)autoScrollView viewForShowAtIndex:(int)index
{

    return [NSString stringWithFormat:@"当前滚动页下标：%d",index];

}

- (UIView *)autoScrollViewShowView:(QSAutoScrollView *)autoScrollView viewForShowAtIndex:(int)index
{
    
    ///获取图片
    UIImage *tempImage = [UIImage imageNamed:self.dataSource[index]];

    UIImageView *currentView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, autoScrollView.frame.size.width, autoScrollView.frame.size.width * tempImage.size.height / tempImage.size.width)];
    currentView.image = tempImage;
    currentView.userInteractionEnabled = YES;
    
    return currentView;

}

@end
