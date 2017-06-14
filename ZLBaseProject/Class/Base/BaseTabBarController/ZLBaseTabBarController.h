//
//  ZLBaseTabBarController.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CYLTabBarController/CYLTabBarController.h>
#import "ZLBaseNaviationController.h"

#import "ZLHomeViewController.h"
#import "ZLCarViewController.h"
#import "ZLMoreViewController.h"
#import "ZLProfileViewController.h"

@interface ZLBaseTabBarController : CYLTabBarController

- (void)gotoSelectedTabBarItem:(NSInteger)index;

@end
