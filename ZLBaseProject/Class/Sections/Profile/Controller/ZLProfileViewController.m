//
//  ZLProfileViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLProfileViewController.h"
#import "UIImage+RoundedCorner.h"
#import "UIImage+Image.h"
#import "UIButton+Indicator.h"

@interface ZLProfileViewController ()

@end

@implementation ZLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIImageView *img_V = [[UIImageView alloc]init];
//    img_V.frame = CGRectMake(20, 100, 200, 200);
//    img_V.image = [[[UIImage imageNamed:@"introductoryPage1"] roundedCornerImage:1 borderSize:1] circleImage];
//    img_V.layer.borderColor = ZLRandomColor.CGColor;
//    img_V.layer.borderWidth = 3;
//    
//    [self.view addSubview:img_V];
//    
//    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [self.view addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(30);
//        make.right.mas_equalTo(-30);
//        make.top.mas_equalTo(img_V.mas_bottom).mas_equalTo(20);
//        make.height.mas_equalTo(35);
//    }];
//    btn.backgroundColor = ZLRandomColor;
//    [btn setTitle:@"AAAAA" forState:(UIControlStateNormal)];
//    [btn bk_addEventHandler:^(id sender) {
//        [btn showIndicator];
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [btn hideIndicator];
//        });
//        
//        [self.netManager GETPath:@"http://www.baidu.com" paras:nil completionHandle:^(id model, NSError *error) {
//            if (!error) {
//                
//            }else{
//                NSLog(@"网络错误");
//            }
//        }];
//        
//        
//    } forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    
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
