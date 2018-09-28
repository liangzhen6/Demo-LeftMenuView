//
//  UINavigationController+MangerNav.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/28.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "UINavigationController+MangerNav.h"
#import <objc/runtime.h>
#import "MangerViewController.h"

@implementation UINavigationController (MangerNav)

/*  失败的处理方式
+ (void)load {
    // 处理方法交换
    
    swizzlingInstanceMethods([UINavigationController class], @selector(pushViewController:animated:), @selector(mNav_pushViewController:animated:));
    swizzlingInstanceMethods([UINavigationController class], @selector(popViewControllerAnimated:), @selector(mNav_popViewControllerAnimated:));
    swizzlingInstanceMethods([UINavigationController class], @selector(popToViewController:animated:), @selector(mNav_popToViewController:animated:));
    swizzlingInstanceMethods([UINavigationController class], @selector(popToRootViewControllerAnimated:), @selector(mNav_popToRootViewControllerAnimated:));
    
    swizzlingInstanceMethods([UINavigationController class], @selector(setViewControllers:), @selector(mNav_setViewControllers:));
}
 */

/**
 动态交换方法
 
 @param class 需要交换的类
 @param sourceSelector 原始方法
 @param customSelector 交换方法
 */
static inline void swizzlingInstanceMethods(Class class, SEL sourceSelector, SEL customSelector) {
    Method sourceMethod = class_getInstanceMethod(class, sourceSelector);
    Method customMethod = class_getInstanceMethod(class, customSelector);
    method_exchangeImplementations(sourceMethod, customMethod);
    
}

- (void)mNav_setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
    NSLog(@"%@",viewControllers);
    [self setViewControllers:viewControllers];
}

- (void)mNav_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self mNav_pushViewController:viewController animated:animated];
    
    [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
}

- (nullable UIViewController *)mNav_popViewControllerAnimated:(BOOL)animated {
    UIViewController * controller = [self mNav_popViewControllerAnimated:animated];
    
    [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
    return controller;
}

- (nullable NSArray<__kindof UIViewController *> *)mNav_popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSArray <UIViewController*> *controllers = [self mNav_popToViewController:viewController animated:animated];
    
    [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
    return controllers;
}

- (nullable NSArray<__kindof UIViewController *> *)mNav_popToRootViewControllerAnimated:(BOOL)animated {
    NSArray <UIViewController*> *controllers = [self mNav_popToRootViewControllerAnimated:animated];
    
    [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
    return controllers;
}

@end
