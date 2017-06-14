//
//  ZLBaseTabBarController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLBaseTabBarController.h"

@interface ZLBaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation ZLBaseTabBarController

- (instancetype)init{

    if (self = [super init]) {
        
        [self setupTabBarController];
       
        self.tabBar.selectedImageTintColor = ZLColor(182, 65, 65);
        
        //第一个item 显示未读消息条数
        UINavigationController  *discoverNav = (UINavigationController *)self.viewControllers[1];
        UITabBarItem *curTabBarItem = discoverNav.tabBarItem;
        [curTabBarItem setBadgeValue:@"5"];
        
    }
    return self;
}



- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}

//控制器设置
- (NSArray *)mpViewControllers {
    
    ZLHomeViewController *firstViewController = [[ZLHomeViewController alloc] init];
    ZLBaseNaviationController *firstNavigationController = [[ZLBaseNaviationController alloc]initWithRootViewController:firstViewController];
    
    ZLCarViewController *secondViewController = [[ZLCarViewController alloc] init];
    ZLBaseNaviationController *secondNavigationController = [[ZLBaseNaviationController alloc]initWithRootViewController:secondViewController];
    
    ZLMoreViewController *thirdViewController = [[ZLMoreViewController alloc] init];
    ZLBaseNaviationController *thirdNavigationController = [[ZLBaseNaviationController alloc]initWithRootViewController:thirdViewController];
    
    ZLProfileViewController *fourthViewController = [[ZLProfileViewController alloc] init];
    ZLBaseNaviationController *fourthNavigationController = [[ZLBaseNaviationController alloc]initWithRootViewController:fourthViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"发现",
                                                  CYLTabBarItemImage : @"mycity_normal",
                                                  CYLTabBarItemSelectedImage : @"mycity_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"更多",
                                                 CYLTabBarItemImage : @"message_normal",
                                                 CYLTabBarItemSelectedImage : @"message_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我",
                                                  CYLTabBarItemImage : @"account_normal",
                                                  CYLTabBarItemSelectedImage : @"account_highlight"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[ZLCarViewController class]];
    if (isBaiDuService) {
        NSLog(@"你点击了TabBar第二个");
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 

- (void)gotoSelectedTabBarItem:(NSInteger)index{

    [self setSelectedIndex:index];
    
}

@end
