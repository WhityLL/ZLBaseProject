//
//  BaseTableViewCellProtocol.h
//  ZLBaseProject_MVVM
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseTableViewCellProtocol <NSObject>

@optional

- (void)setupViews;

/**
 绑定一个viewmodel给view
 
 @param viewModel Viewmodel
 */

- (void)bindViewModel:(id)viewModel;

@end
