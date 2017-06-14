//
//  ZLBaseNaviationController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLBaseNaviationController.h"

@interface ZLBaseNaviationController ()

@end

@implementation ZLBaseNaviationController

+(void)initialize
{
    if (self==[ZLBaseNaviationController class]) {
        
        //外观的设置
        //0. 获取导航栏的实例
        UINavigationBar *bar=[UINavigationBar appearance];
        //1.设置导航栏的背景图
//        UIImage *imageNavBack =[UIImage BgImageFromColors:@[ZLColor(252, 107, 82),ZLColor(229, 76, 60)] withFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
//        [bar setBackgroundImage:[UIImage buttonImageWithSize:CGSizeMake(SCREEN_WIDTH, 64) FromColor:kRedOrangeColor] forBarMetrics:(UIBarMetricsDefault)];
//        [bar setBackgroundImage:imageNavBack forBarMetrics:(UIBarMetricsDefault)];
        
        
        //去掉导航栏下面的细线（必须设置背景图片，不能setBarTintColor）
        bar.shadowImage = [[UIImage alloc] init];
        
        [bar setBarStyle:(UIBarStyleDefault)];
        
        //barTintColor背景色; tintColor是barButtonItem颜色; titleTextAttributes是标题颜色
        [bar setTintColor:[UIColor whiteColor]];//左右按钮的颜色 白色

        [bar setBarTintColor:[UIColor yellowColor]];

        
//        NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
//        attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//        [bar setTitleTextAttributes:attributes];
        
    }
}


//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = 0;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view.
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
