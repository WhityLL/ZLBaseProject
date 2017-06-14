//
//  ZLHomeViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLHomeViewController.h"
#import "CocoaSecurity.h"
#import "ZL_drawRectView.h"

@interface ZLHomeViewController ()

@property (nonatomic ,strong)UITableView *tableView;

@end

@implementation ZLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    ZL_drawRectView *imageV = [[ZL_drawRectView alloc]init];
    [self.view addSubview:imageV];
    imageV.frame = CGRectMake(80, 80, 300, 400);
    
}



@end
