//
//  ViewManger.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/27.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "ViewManger.h"

#define Screen_Frame     [[UIScreen mainScreen] bounds]
#define Screen_Width     [[UIScreen mainScreen] bounds].size.width
#define Screen_Height    [[UIScreen mainScreen] bounds].size.height
#define KeyWindow [[[UIApplication sharedApplication] delegate] window]
#define MaginWidth Screen_Width * 0.8

@interface ViewManger ()
@property(nonatomic,strong)UIViewController *leftVC;
@property(nonatomic,strong)UIViewController *mainVC;
@property(nonatomic,strong)UIView *maskView;
@end
static ViewManger * _viewManger = nil;
@implementation ViewManger
+ (id)shareViewManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_viewManger == nil) {
            _viewManger = [[ViewManger alloc] init];
        }
    });
    return _viewManger;
}

- (void)setLeftViewController:(UIViewController *)leftVC mianViewController:(UIViewController *)mainVC {
    self.leftVC = leftVC;
    self.mainVC = mainVC;
    // 设置阴影
    mainVC.view.layer.shadowColor = [UIColor blackColor].CGColor;
    // 阴影透明度
    mainVC.view.layer.shadowOpacity = 0.5;
    // 阴影切圆角
    mainVC.view.layer.shadowRadius = 4.0;
    // 阴影偏移
    mainVC.view.layer.shadowOffset = CGSizeMake(-3, 0);
    
    [leftVC.view addSubview:mainVC.view];
    [leftVC addChildViewController:mainVC];
    
    // 增加侧边栏 呼出手势
    UIView * leftOpenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, Screen_Height)];
    leftOpenView.backgroundColor = [UIColor redColor];
    [mainVC.view addSubview:leftOpenView];
    UIPanGestureRecognizer * leftOpenPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftOpenPanAtion:)];
    [leftOpenView addGestureRecognizer:leftOpenPan];
    
    // 增加遮罩 + 增加手势
    UIPanGestureRecognizer * maskPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    UITapGestureRecognizer * maskTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    UIView * maskView = [[UIView alloc] initWithFrame:Screen_Frame];
    [mainVC.view addSubview:maskView];
    maskView.alpha = 0.0;
    maskView.backgroundColor = [UIColor blackColor];
    [maskView addGestureRecognizer:maskPan];
    [maskView addGestureRecognizer:maskTap];
    self.maskView = maskView;
    
}
#pragma mark --GestureRecognizer
- (void)panAction:(UIPanGestureRecognizer *)pan {
    CGPoint translatedPoint = [pan translationInView:self.maskView];
    CGPoint velocityPoint =  [pan velocityInView:self.maskView];
    
    NSLog(@"%@----%@",NSStringFromCGPoint(translatedPoint),NSStringFromCGPoint(velocityPoint));
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            {// 开始
                
            }
            break;
        case UIGestureRecognizerStateChanged:
            {// 变化中
                CGFloat maginX = MaginWidth + translatedPoint.x;
                if (maginX >=0 && maginX < MaginWidth) {
                    CGRect frame = self.mainVC.view.frame;
                    frame.origin.x = maginX;
                    self.mainVC.view.frame = frame;
                    self.maskView.alpha = maginX * 0.5 / MaginWidth;
                }
            }
            break;
        case UIGestureRecognizerStateEnded:
            {// 结束
                if (self.mainVC.view.frame.origin.x <= MaginWidth/2 || -velocityPoint.x > 800) {
                    // 当滑动距离 大于 MaginWidth 的一半 或者速度 往 关闭的方向 大于800时 就关闭
                    [self dismissLeftViewAnimateWithDuration:0.3];
                } else {
                    [self showLeftViewAnimateWithDuration:0.05];
                }
            }
            break;
        default:
            break;
    }
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    [self dismissLeftViewAnimateWithDuration:0.3];
}

- (void)leftOpenPanAtion:(UIPanGestureRecognizer *)pan {
    CGPoint translatedPoint = [pan translationInView:pan.view];
    CGPoint velocityPoint =  [pan velocityInView:pan.view];
    
    NSLog(@"%@----%@",NSStringFromCGPoint(translatedPoint),NSStringFromCGPoint(velocityPoint));
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {// 开始
            
        }
            break;
        case UIGestureRecognizerStateChanged:
        {// 变化中
            CGFloat maginX = translatedPoint.x;
            if (maginX >=0 && maginX < MaginWidth) {
                CGRect frame = self.mainVC.view.frame;
                frame.origin.x = maginX;
                self.mainVC.view.frame = frame;
                self.maskView.alpha = maginX * 0.5 / MaginWidth;
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {// 结束
            if (self.mainVC.view.frame.origin.x >= MaginWidth/2 || velocityPoint.x > 800) {
                // 当滑动距离 大于 MaginWidth 的一半 或者速度 往 打开的方向 大于800时 就打开
                [self showLeftViewAnimateWithDuration:0.3];
            } else {
                [self dismissLeftViewAnimateWithDuration:0.05];
            }
        }
            break;
        default:
            break;
    }
}

- (void)showLeftViewAnimateWithDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.mainVC.view.frame;
        frame.origin.x = MaginWidth;
        self.mainVC.view.frame = frame;
        self.maskView.alpha = 0.5;
    }];
}
- (void)dismissLeftViewAnimateWithDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.mainVC.view.frame;
        frame.origin.x = 0;
        self.mainVC.view.frame = frame;
        self.maskView.alpha = 0.0;
    }];
}

@end
