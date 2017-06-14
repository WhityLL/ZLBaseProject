//
//  MBProgressHUD+HUD.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "MBProgressHUD+HUD.h"

@implementation MBProgressHUD (HUD)

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error ToView:(UIView *)view{
    [self showCustomIcon:@"MBHUD_Error" Title:error ToView:view];
}

+ (void)showSuccess:(NSString *)success ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Success" Title:success ToView:view];
}

+ (void)showInfo:(NSString *)Info ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Info" Title:Info ToView:view];
}

+ (void)showWarn:(NSString *)Warn ToView:(UIView *)view
{
    [self showCustomIcon:@"MBHUD_Warn" Title:Warn ToView:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message ToView:(UIView *)view {
    
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=message;
    hud.labelFont=CHINESE_SYSTEM(15);
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //代表需要蒙版效果
//    hud.dimBackground = YES;
    return hud;
}


/** 显示忙 */
+ (void)showBusy{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        UIView *view = (UIView*)[UIApplication sharedApplication].delegate.window;
        
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
        
        [self showMessage:@"Loading" ToView:nil];
        
    }];
    
}


/**
 *  进度条View
 */
+ (MBProgressHUD *)showProgressToView:(UIView *)view Text:(NSString *)text{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText=text;
    hud.labelFont=CHINESE_SYSTEM(15);
    // 代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}


//快速显示一条提示信息
+ (void)showAutoMessage:(NSString *)message{
    
    [self showAutoMessage:message ToView:nil];
}


//自动消失提示，无图
+ (void)showAutoMessage:(NSString *)message ToView:(UIView *)view{
    [self showMessage:message ToView:view RemainTime:2 Model:MBProgressHUDModeText];
}

//自定义停留时间，有图
+(void)showIconMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time{
    [self showMessage:message ToView:view RemainTime:time Model:MBProgressHUDModeIndeterminate];
}

//自定义停留时间，无图
+(void)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time{
    [self showMessage:message ToView:view RemainTime:time Model:MBProgressHUDModeText];
}

+(void)showMessage:(NSString *)message ToView:(UIView *)view RemainTime:(CGFloat)time Model:(MBProgressHUDMode)model{
    
    __block typeof(view) blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (blockView == nil) blockView = (UIView*)[UIApplication sharedApplication].delegate.window;
        //弹出新的提示之前,先把旧的隐藏掉
        [MBProgressHUD hideAllHUDsForView:blockView animated:YES];
        
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.labelText=message;
        hud.labelFont=CHINESE_SYSTEM(15);
        //模式
        hud.mode = model;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // 代表需要蒙版效果
        hud.dimBackground = NO;
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        // X秒之后再消失
        [hud hide:YES afterDelay:time];
        
    });
    
}

+ (void)showCustomIcon:(NSString *)iconName Title:(NSString *)title ToView:(UIView *)view
{
    
    __block typeof(view) blockView = view;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (blockView == nil) blockView = (UIView*)[UIApplication sharedApplication].delegate.window;
        //弹出新的提示之前,先把旧的隐藏掉
        [MBProgressHUD hideAllHUDsForView:blockView animated:YES];
        
        // 快速显示一个提示信息
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:blockView animated:YES];
        hud.labelText=title;
        hud.labelFont=CHINESE_SYSTEM(15);
        // 设置图片
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
        
        // 再设置模式
        hud.mode = MBProgressHUDModeCustomView;
        
        // 隐藏时候从父控件中移除
        hud.removeFromSuperViewOnHide = YES;
        
        // 代表需要蒙版效果
        hud.dimBackground = NO;
        
        // 3秒之后再消失
        [hud hide:YES afterDelay:2];
        
    });

}

+ (void)hideHUDForView:(UIView *)view
{
    
    __block typeof(view) blockView = view;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        if (blockView == nil) blockView = (UIView*)[UIApplication sharedApplication].delegate.window;
        [MBProgressHUD hideAllHUDsForView:blockView animated:YES];
        
    }];
    
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
