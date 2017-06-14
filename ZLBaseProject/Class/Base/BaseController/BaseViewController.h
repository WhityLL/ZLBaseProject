//
//  BaseViewController.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewControllerPotocol.h"
#import "UIImage+Color.h"
#import "NetManager.h"
#import "Reachability.h"

@protocol  BaseViewControllerDataSource<NSObject>

- (UIButton*)set_leftButton;
- (UIButton*)set_rightButton;
- (UIImage*)set_leftBarButtonItemWithImage;
- (UIImage*)set_rightBarButtonItemWithImage;

//设置纯色navi背景
- (UIColor *)set_NaviBackgroundColor;
- (CGFloat)set_navigationHeight;
- (BOOL)hideNavigationBottomLine;

@end

/**
 *  以上protocol 方法可以重写
 */

@interface BaseViewController : UIViewController<BaseViewControllerDataSource,BaseViewControllerPotocol>

@property (nonatomic ,strong) NetManager *netManager;

- (void)setBaseViewBackGroundColor:(UIColor *)color;
//title标题
- (void)set_NaviTitle:(NSString *)title;
//设置纯色navi背景
- (void)set_NaviBackgroundWithColor:(UIColor *)color;
//设置图片Navi背景
- (void)set_NaviBackgroundWithImage:(UIImage *)image;
//是否隐藏导航栏底部的线
- (void)set_hideNavigationBottomLine:(BOOL)isHide;

//改变导航栏高度（用于隐藏导航栏得时候）
- (void)changeNavigationBarTranslationY:(CGFloat)translationY;

- (void)naviTitle_click_event:(UIView *)sender;
- (void)naviLeft_click_event:(UIButton *)sender;
- (void)naviRight_click_event:(UIButton *)sender;
@end
