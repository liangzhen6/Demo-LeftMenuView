# Demo-LeftMenuView
一个 左滑菜单的解决方案。
 侧滑菜单的注意事项：
 1. 初始化 为 mangerVC 设置 leftVC 和 mainVC
 2. 设置 mangerVC为window 的rootViewController
 3. 如果有 UINavigationController 需要在 UINavigationController 实现下面自己的代理
 
 - (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
 [[MangerViewController shareMangerViewController] mainOpenLeftViewHidden:self.viewControllers.count > 1];
 
 }
