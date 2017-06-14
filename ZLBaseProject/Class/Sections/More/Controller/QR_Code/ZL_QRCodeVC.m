//
//  ZL_QRCodeVC.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/5/9.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_QRCodeVC.h"

#import "QRCodeGenerateVC.h"
#import "QRCodeScanningVC.h"

@interface ZL_QRCodeVC ()

@end

@implementation ZL_QRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 200, 200, 40);
    [btn setTitle:@"generateQRCode" forState:(UIControlStateNormal)];
    [btn setTitleColor:ZLRandomColor forState:(UIControlStateNormal)];
    [btn bk_addEventHandler:^(id sender) {
        QRCodeGenerateVC *VC = [[QRCodeGenerateVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:btn1];
    btn1.frame = CGRectMake(50, 400, 200, 40);
    [btn1 setTitle:@"scanQRCode" forState:(UIControlStateNormal)];
    [btn1 setTitleColor:ZLRandomColor forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(scanClick:) forControlEvents:(UIControlEventTouchUpInside)];

}

- (void)scanClick:(UIButton *)sender{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                    });
                    
                    SGQRCodeLog(@"当前线程 - - %@", [NSThread currentThread]);
                    // 用户第一次同意了访问相机权限
                    SGQRCodeLog(@"用户第一次同意了访问相机权限");
                    
                } else {
                    
                    // 用户第一次拒绝了访问相机权限
                    SGQRCodeLog(@"用户第一次拒绝了访问相机权限");
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            QRCodeScanningVC *vc = [[QRCodeScanningVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [self presentViewController:alertC animated:YES completion:nil];
    } 
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
