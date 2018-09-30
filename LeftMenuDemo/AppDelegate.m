//
//  AppDelegate.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/27.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "MainTabbarViewController.h"
#import "MangerViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/*
 侧滑菜单的注意事项：
 1. 初始化 为 mangerVC 设置 leftVC 和 mainVC
 2. 设置 mangerVC为window 的rootViewController
 3. 如果有 UINavigationController 需要在 UINavigationController 实现下面自己的代理
 
 - (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
 [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
 
 }
 
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LeftViewController * left = [LeftViewController new];
//    MainViewController * main = [MainViewController new];
    //设置tabbar
    MainTabbarViewController * mainTabbar = [[MainTabbarViewController alloc] init];
    
    MangerViewController *mangerVC = [MangerViewController shareMangerViewController];
    [mangerVC setLeftViewController:left mainViewController:mainTabbar];
    
    self.window.rootViewController = mangerVC;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
