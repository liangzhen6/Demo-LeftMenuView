//
//  MainViewController.m
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/28.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#import "MainViewController.h"
#import "Header.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * testlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, Screen_Width, 40)];
    testlabel.text = @"这是测试的label这是测试的label这是测试的label这是测试的label这是测试的label";
    testlabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:testlabel];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)nextAction:(UIButton *)sender {
    MainViewController * main = [MainViewController new];
    main.title = @"新的一页";
    main.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:main animated:YES];
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
