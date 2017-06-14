//
//  AppDelegate.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkUnit.h"
#import "AdvertiseHelper.h"
#import "IntroductoryPagesHelper.h"
#import "LoginViewController.h"
#import "ZLBaseTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic ,strong) ZLBaseTabBarController *tabBarController;

@property (nonatomic ,assign) NetworkStatus currentNetworkStatus;

@property (nonatomic ,assign) NSInteger     requestTimeoutInterval;

//跳转到登录页面
- (void)togoLoginViewController;

//跳转到tabBar页面
- (void)togoTabBarViewController;

- (void)togoTabBarItem:(NSInteger)index;

@end

