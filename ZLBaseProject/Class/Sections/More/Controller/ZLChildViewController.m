//
//  ZLChildViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLChildViewController.h"

@interface ZLChildViewController ()

@end

@implementation ZLChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBaseViewBackGroundColor:[UIColor cyanColor]];
    
    [self layoutPageView];
 
    [self set_NaviTitle:@"ChildVC"];
    
}

- (void)viewWillAppear:(BOOL)animated{
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//左边按钮（重写）
- (UIButton *)set_leftButton{
    UIButton *left_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [left_button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateHighlighted];
    return left_button;
}

//设置右边按键（如果没有右边 可以不重写）
-(UIButton*)set_rightButton
{
    UIButton *right_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    
    [right_button setImage:[UIImage imageNamed:@"nav_complete"] forState:UIControlStateNormal];
    [right_button setImage:[UIImage imageNamed:@"nav_complete"] forState:UIControlStateHighlighted];
    [right_button setTitle:@"改变" forState:(UIControlStateNormal)];
    
    return right_button;
}
//Navi按钮点击事件
- (void)naviTitle_click_event:(UIView *)sender{
    [MBProgressHUD showAutoMessage:@"点击了标题"];
}

- (void)naviLeft_click_event:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)naviRight_click_event:(UIButton *)sender{
    
    [self set_NaviTitle:@"改变标题"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD showAutoMessage:@"修改成功"];
    });
}

#pragma mark 自定义代码

-(void)layoutPageView
{
    UILabel *myLabel=[[UILabel alloc]init];
    myLabel.font=CHINESE_SYSTEM(15);
    myLabel.numberOfLines=0;
    [myLabel sizeToFit];
    myLabel.text=@"项目中可以让所有的页面都继承BaseViewController，可以重写它一些关于Nav的内容，不必要时可不重写，就不会有效果展现，以后也可以做统一处理";
    myLabel.textAlignment=NSTextAlignmentCenter;
    myLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:myLabel];
    [myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    UIButton *leftButton=[[UIButton alloc]init];
    [leftButton setTitle:@"纯色导航" forState:UIControlStateNormal];
    leftButton.backgroundColor=[UIColor blueColor];
    [leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
    
    UIButton *rightButton=[[UIButton alloc]init];
    [rightButton setTitle:@"隐藏导航" forState:UIControlStateNormal];
    rightButton.backgroundColor=[UIColor greenColor];
    [rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(SCREEN_WIDTH/2);
    }];
}


-(void)leftButtonAction
{
    MPSolidColorViewController *vc=[[MPSolidColorViewController alloc]init];
    //把动画关掉
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)rightButtonAction
{
    MPHideNavigationViewController *vc=[[MPHideNavigationViewController alloc]init];
    //把动画关掉
    [self.navigationController pushViewController:vc animated:YES];
}

@end
