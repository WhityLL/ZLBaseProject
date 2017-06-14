//
//  QRCodeGenerateVC.m
//  SGQRCodeExample
//
//  Created by Sorgle on 16/8/25.
//  Copyright © 2016年 Sorgle. All rights reserved.
//

#import "QRCodeGenerateVC.h"
#import "SGQRCode.h"

@interface QRCodeGenerateVC ()

@end

@implementation QRCodeGenerateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.87 alpha:1.0];
    
    // 生成二维码(Default)
//    [self setupGenerateQRCode];
    
    // 生成二维码(中间带有图标)
    [self setupGenerate_Icon_QRCode];
    
    // 生成二维码(彩色)
//    [self setupGenerate_Color_QRCode];

}

// 生成二维码
- (void)setupGenerateQRCode {

    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 80;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
//    imageView.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"https://github.com/kingsic" imageViewWidth:imageViewW];
//    另外二维码的生成是比较耗时的有可能会阻塞主线程,特别是配置比较低的设配会有点卡顿,有经验的同学都知道像这种耗时(特别是绘制logo的二维码的时候)的操作要放到子线程去的
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"https://github.com/kingsic" imageViewWidth:imageViewW];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });
    
    
#pragma mark - - - 模仿支付宝二维码样式（添加用户头像）
    CGFloat scale = 0.22;
    CGFloat borderW = 5;
    UIView *borderView = [[UIView alloc] init];
    CGFloat borderViewW = imageViewW * scale;
    CGFloat borderViewH = imageViewH * scale;
    CGFloat borderViewX = 0.5 * (imageViewW - borderViewW);
    CGFloat borderViewY = 0.5 * (imageViewH - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor purpleColor].CGColor;
    borderView.layer.cornerRadius = 10;
    borderView.layer.masksToBounds = YES;
    borderView.layer.contents = (id)[UIImage imageNamed:@"introductoryPage4"].CGImage;

//    [imageView addSubview:borderView];
}

#pragma mark - - - 中间带有图标二维码生成
- (void)setupGenerate_Icon_QRCode {
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 240;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    CGFloat scale = 0.2;
    
    // 2、将最终合得的图片显示在UIImageView上
//    imageView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"https://github.com/kingsic" logoImageName:@"introductoryPage4" logoScaleToSuperView:scale];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"https://github.com/kingsic" logoImageName:@"introductoryPage4" logoScaleToSuperView:scale];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });
    
}

#pragma mark - - - 彩色图标二维码生成
- (void)setupGenerate_Color_QRCode {
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 400;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将二维码显示在UIImageView上
//    imageView.image = [SGQRCodeTool SG_generateWithColorQRCodeData:@"https://github.com/kingsic" backgroundColor:[CIColor colorWithRed:1 green:0 blue:0.8] mainColor:[CIColor colorWithRed:0.3 green:0.2 blue:0.4]];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [SGQRCodeTool SG_generateWithColorQRCodeData:@"https://github.com/kingsic" backgroundColor:[CIColor colorWithRed:1 green:0 blue:0.8] mainColor:[CIColor colorWithRed:0.3 green:0.2 blue:0.4]];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });
}


@end

