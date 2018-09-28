//
//  LeftViewController.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/27.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "LeftViewController.h"
//#import "ViewManger.h"
#import "Header.h"
#import "MainTabbarViewController.h"
#import "MainNavViewController.h"
#import "MangerViewController.h"
#import "MainViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * testlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, Screen_Width, 40)];
    testlabel.text = @"这是测试的label这是测试的label这是测试的label这是测试的label这是测试的label";
    testlabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:testlabel];
    // Do any additional setup after loading the view.
}
- (IBAction)nextAction:(UIButton *)sender {
    NSLog(@"点击了");
    UIViewController * parentVC = self.parentViewController;
    MainTabbarViewController * tabBar = parentVC.childViewControllers[1];
    MainNavViewController * nav = tabBar.viewControllers[tabBar.selectedIndex];
    [(MangerViewController *)parentVC dismissLeftViewAnimate:NO duration:0.0];
    MainViewController * mainVC = [[MainViewController alloc] init];
    mainVC.hidesBottomBarWhenPushed = YES;
    mainVC.title = @"从leftView来的";
    [nav pushViewController:mainVC animated:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击事件正常！！！");
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
