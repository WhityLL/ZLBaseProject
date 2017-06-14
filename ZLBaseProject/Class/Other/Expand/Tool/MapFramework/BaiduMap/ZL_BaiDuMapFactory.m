//
//  ZL_BaiDuMapFactory.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_BaiDuMapFactory.h"
#import "ZL_BaiduMapView.h"

@implementation ZL_BaiDuMapFactory

- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    return [[ZL_BaiduMapView alloc]initWithFrame:frame];
}

@end
