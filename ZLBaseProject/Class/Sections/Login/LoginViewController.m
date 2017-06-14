//
//  LoginViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = ZLRandomColor;
    
    self.navigationItem.title = @"登录与注册";
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64+20);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(40);
    }];
    [btn setTitle:@"登录" forState:(UIControlStateNormal)];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn bk_addEventHandler:^(id sender) {
        
        [appDelegateInstance togoTabBarViewController];
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *regist = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:regist];
    [regist mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).offset(50);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(40);
    }];
    [regist setTitle:@"注册" forState:(UIControlStateNormal)];
    [regist setBackgroundColor:[UIColor cyanColor]];
    [regist bk_addEventHandler:^(id sender) {
        
        RegistViewController *re = [[RegistViewController alloc]init];
        
        [self.navigationController pushViewController:re animated:YES];
        
        
    } forControlEvents:(UIControlEventTouchUpInside)];
    
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
