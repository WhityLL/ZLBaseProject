//
//  MPHideNavigationViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/8/3.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPHideNavigationViewController.h"

@implementation MPHideNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    [self set_NaviBackgroundWithColor:[UIColor whiteColor]];
    
    UIView *headerView=[[UIView alloc]init];
    headerView.backgroundColor=[UIColor redColor];
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(180);
    }];
    
    UIButton *rightButton=[[UIButton alloc]init];
    [rightButton setTitle:@"再现导航" forState:UIControlStateNormal];
    rightButton.backgroundColor=[UIColor blueColor];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //如果要隐藏NavigationBar
    [self changeNavigationBarTranslationY:-64];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //如果隐藏NavigationBar,退出去时还得开放出来
    [self changeNavigationBarTranslationY:0];
}


#pragma mark 重写BaseViewController设置内容

//是否隐藏导航栏底部的黑线 默认也为NO
-(BOOL)hideNavigationBottomLine
{
    return NO;
}

//设置左边按键
-(UIButton*)set_leftButton
{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    left_button.userInteractionEnabled  =YES;
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
    return left_button;
}

//设置左边事件
- (void)naviLeft_click_event:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 自定义代码

-(void)rightButtonAction
{
    MPHideNavigationChildrenViewController *vc=[[MPHideNavigationChildrenViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
