//
//  ViewManger.h
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/27.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
 1. leftview 滑动 也要变化，是 main的 一半
 2. 测试 mian 是tabbar 的情况。
 */
@interface ViewManger : NSObject
+ (id)shareViewManger;
- (void)setLeftViewController:(UIViewController *)leftVC mianViewController:(UIViewController *)mainVC;

- (void)showLeftViewAnimateWithDuration:(NSTimeInterval)duration;
- (void)dismissLeftViewAnimateWithDuration:(NSTimeInterval)duration;
@end
