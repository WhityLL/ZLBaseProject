//
//  WX_AliPayViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/29.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "WX_AliPayViewController.h"
#import "XMLDictionary.h"

@interface WX_AliPayViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *array;
}

@property (nonatomic ,strong)UITableView *tableView;

@end

@implementation WX_AliPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付";
    self.view.backgroundColor = [UIColor orangeColor];
    
    array = [[NSArray alloc]initWithObjects:@"WeChatPay",@"AliPay",nil];
    
    self.tableView.hidden = NO;
}


#pragma mark -
#pragma mark -- UItableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"payCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Alipay";
        cell.detailTextLabel.text = @"支付宝";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"WeChatPay";
        cell.detailTextLabel.text = @"微信支付";
    }
    
    return cell;
}

#pragma mark -- UItableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
//        [self aliPayClick];
    }else if (indexPath.row == 1){
//        [self wechatPayClick];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
