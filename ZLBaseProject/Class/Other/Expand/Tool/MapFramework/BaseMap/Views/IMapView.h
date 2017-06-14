//
//  IMapView.h
//  BaiduMap_20170222
//
//  Created by LiuLei on 2017/2/22.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^location)();
@protocol IMapView <NSObject>

- (instancetype)initWithFrame:(CGRect)frame;
//第一个标准：必须是UIView的子类
//父类的指针指向子类的实例对象（oop）
//
- (UIView *)getMapView;

//获取用户位置信息
- (void)getUserLocaton:(void(^)(CLLocation *))locationBlock;

@end
