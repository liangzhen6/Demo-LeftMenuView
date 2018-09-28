//
//  MianTabbarViewController.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/28.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "MainNavViewController.h"
#import "MainViewController.h"
#import "UINavigationController+MangerNav.h"
#import "Header.h"

@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitleStyles];
    [self initTabbar];
    // Do any additional setup after loading the view.
}
- (void)initTabbar {
    NSMutableArray * viewControllers = [[NSMutableArray alloc] init];
    NSArray * titles = @[@"首页", @"我"];
    for (NSString * title in titles) {
        MainViewController * vc = [[MainViewController alloc] init];
        vc.title = title;
        MainNavViewController * nav = [[MainNavViewController alloc] initWithRootViewController:vc];
        [nav.tabBarItem setTitle:title];
        
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:149.f/255 green:209.f/255 blue:183.f/255 alpha:1.0]} forState:UIControlStateSelected];
        [viewControllers addObject:nav];
    }
    
    self.viewControllers = viewControllers;
}
//为导航栏设置统一样式
- (void)setNavTitleStyles {
    UIFont *font = [UIFont boldSystemFontOfSize:19.0];
    //设置title的字体与颜色
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName : RGBColor(71.0, 71.0, 71.0)
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    //设置返回按钮的颜色
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    // 设置字体颜色为透明
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:17],
                                 NSForegroundColorAttributeName:[UIColor clearColor]
                                 };
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
