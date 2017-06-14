//
//  ZLBlankPageViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLBlankPageViewController.h"

@interface ZLBlankPageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray      *dataArray;
@property (nonatomic,strong) UITableView         *tableView;
@end

@implementation ZLBlankPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self set_NaviTitle:@"空白页展现"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.dataArray addObjectsFromArray:@[@"A",@"B"]];
    
    [self.tableView reloadData];
}

//设置右边按键（如果没有右边 可以不重写）
-(UIButton*)set_rightButton
{
    UIButton *right_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 65, 22)];
    [right_button setTitle:@"出错效果" forState:UIControlStateNormal];
    right_button.titleLabel.font=CHINESE_SYSTEM(14);
    [right_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    return right_button;
}

//设置右边事件
-(void)naviRight_click_event:(UIButton *)sender
{
    __weak typeof(self)weakSelf = self;
    [self.view configBlankPage:EaseBlankPageTypeProject hasData:(self.dataArray.count>0) hasError:YES reloadButtonBlock:^(id sender) {
        [MBProgressHUD showInfo:@"重新加载的数据" ToView:self.view];
        [weakSelf.tableView.mj_header beginRefreshing];
    }];
}

#pragma mark -- UITableViewDataSources
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.accessoryType    = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text   = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)loadMyTableData
{
    //请求服务端接口并返回数据
    __weak typeof(self)weakSelf = self;
    
    //成功时
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
    //增加无数据展现
    
    [self.view configBlankPage:EaseBlankPageTypeView hasData:self.dataArray.count hasError:(self.dataArray.count>0) reloadButtonBlock:^(id sender) {
        [MBProgressHUD showInfo:@"重新加载的数据" ToView:self.view];
        [weakSelf.tableView.mj_header beginRefreshing];
    }];
    
//    失败时
//    [self.view configBlankPage:EaseBlankPageTypeView hasData:(self.dataArray.count>0) hasError:YES reloadButtonBlock:^(id sender) {
//        [MBProgressHUD showInfo:@"重新加载的数据" ToView:self.view];
//        [weakSelf.tableView reloadData];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)dataArray {
	if(_dataArray == nil) {
		_dataArray = [[NSMutableArray alloc] init];
	}
	return _dataArray;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            //模拟加载服务端数据
            [self loadMyTableData];
        }];
        
        [_tableView.mj_header beginRefreshing];
        
	}
	return _tableView;
}

@end
