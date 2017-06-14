//
//  BaseViewModelProtocol.h
//  basicFramework
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@protocol BaseViewModelProtocol <NSObject>

@optional

- (instancetype)initWithModel:(id)model;

@property (strong, nonatomic)NetManager *netManager;
/**
 *  初始化
 */
- (void)initialize;

@end
