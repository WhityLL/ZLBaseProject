//
//  MPSolidColorViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/8/3.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPSolidColorViewController.h"

@implementation MPSolidColorViewController


#pragma mark viewController生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self set_NaviTitle:@"纯色导航栏"];
    
    UIView *headerView=[[UIView alloc]init];
    headerView.backgroundColor=[UIColor redColor];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(120);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self set_hideNavigationBottomLine:YES];
    //设置导航栏背景图片
    [self set_NaviBackgroundWithColor:[UIColor redColor]];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //设置导航栏背景图片
//    [self set_NaviBackgroundWithImage:[UIImage imageWithColor:[UIColor cyanColor]]];
    
    [self set_hideNavigationBottomLine:NO];
    
}



#pragma mark 重写BaseViewController设置内容

//不重写父类方法，则为默认
//设置左边按键
//- (UIImage *)set_leftBarButtonItemWithImage{
//    UIImage *image = [UIImage imageNamed:@"nav_back"];
//    return image;
//}
//-(UIButton*)set_leftButton
//{
//    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
//    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
//    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
//    return left_button;
//}

//设置左边事件
-(void)naviLeft_click_event:(UIButton *)sender
{
    //把动画关掉
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark 自定义代码


@end
