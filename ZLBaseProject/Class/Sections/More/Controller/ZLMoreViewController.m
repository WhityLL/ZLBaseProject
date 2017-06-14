//
//  ZLMoreViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/12.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "ZLMoreViewController.h"

@interface ZLMoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray      *dataArray;
@property (nonatomic,strong) UITableView         *tableView;

@end

@implementation ZLMoreViewController

#pragma mark -- lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"功能导航";
    
    [self.dataArray addObjectsFromArray:@[@"继承BaseViewController运用",@"列表空白页展现",@"字体适配机型",@"照片上传",@"支付",@"多线程GCD",@"Runtime",@"JSPatch热更新",@"LKDB数据库运用",@"百度地图",@"二维码",@"照片上传附带进度",@"日志记录",@"列表倒计时",@"H5交互WebViewJavascriptBridge",@"省市区三级联动",@"自定义弹出窗",@"YYText富文本实例",@"列表行展开跟回收隐藏",@"常见表单行类型" ,@"人脸识别注册及验证"]];
    
    //弹出提示
    [self showNewStatusesCount:self.dataArray.count];
    
    self.tableView.hidden = NO;
    
}

#pragma mark UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            ZLChildViewController *vc=[[ZLChildViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 1:
        {
            ZLBlankPageViewController *vc=[[ZLBlankPageViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 2:
        {
            ZLAdaptationFontViewController *vc=[[ZLAdaptationFontViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 3:
        {
            ZLUpLoadImageViewController *vc=[[ZLUpLoadImageViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        
        case 4:
        {
            WX_AliPayViewController *vc=[[WX_AliPayViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 5:
        {
            GCD_ViewController *vc=[[GCD_ViewController alloc]initWithNibName:@"GCD_ViewController" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 6:
        {
            RuntimeViewController *vc=[[RuntimeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 9:
        {
            MapViewController *vc=[[MapViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 10:
        {
            ZL_QRCodeVC *vc=[[ZL_QRCodeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 自定义代码
- (void)showNewStatusesCount:(NSInteger)count
{
    // 1.创建一个UILabel
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    
    // 2.显示文字
    if (count) {
        label.text = [NSString stringWithFormat:@"共有%ld条实例数据", count];
    } else {
        label.text = @"没有最新的数据";
    }
    
    // 3.设置背景
    label.backgroundColor = [UIColor colorWithRed:254/255.0  green:129/255.0 blue:0 alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    // 4.设置frame
    label.width = self.view.frame.size.width;
    label.height = 35;
    label.x = 0;
    label.y = CGRectGetMaxY([self.navigationController navigationBar].frame) - label.frame.size.height;
    
    // 5.添加到导航控制器的view
    //[self.navigationController.view addSubview:label];
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    // 6.动画
    CGFloat duration = 0.75;
    //label.alpha = 0.0;
    [UIView animateWithDuration:duration animations:^{
        // 往下移动一个label的高度
        label.transform = CGAffineTransformMakeTranslation(0, label.frame.size.height);
        //label.alpha = 1.0;
    } completion:^(BOOL finished) { // 向下移动完毕
        
        // 延迟delay秒后，再执行动画
        CGFloat delay = 1.0;
        
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            // 恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
            //label.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
            // 删除控件
            [label removeFromSuperview];
        }];
    }];
}

#pragma mark -- lazyLoad
- (NSMutableArray *)dataArray {
	if(_dataArray == nil) {
		_dataArray = [[NSMutableArray alloc] init];
	}
	return _dataArray;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
        
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator   = NO;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.tableFooterView = [UIView new];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(64);
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-49);
        }];
	}
	return _tableView;
}

@end
