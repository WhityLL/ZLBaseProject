//
//  ZL_MapFactory.h
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"

@protocol ZL_MapFactory <NSObject>

//生成MapView
//遵循IMapView协议  因为工厂不知道生成什么地图
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame;

@end
