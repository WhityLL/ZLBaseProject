//
//  BaseTabView.h
//  basicFramework
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"
@interface BaseTabView : UIView<BaseViewProtocol>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *rowArray;
@property(nonatomic, assign)NSInteger sectionSum;
@property(nonatomic, strong)NSMutableArray *rowHeigthArray;
@property(nonatomic, assign)NSInteger tableViewStyle;
@property(nonatomic, assign)CGRect tabFrame;


-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section;
-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section;
-(UIView *)rootTableView:(UITableView *)rootTableView viewForFooterInSection:(NSInteger)section;
-(UIView*)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section;

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
