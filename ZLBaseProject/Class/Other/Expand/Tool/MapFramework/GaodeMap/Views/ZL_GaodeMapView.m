//
//  ZL_GaodeMapView.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_GaodeMapView.h"

@interface ZL_GaodeMapView ()<MAMapViewDelegate>{
    MAMapView *_mapView;
    
}
@end

@implementation ZL_GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super init]) {
        _mapView = [[MAMapView alloc]initWithFrame:frame];
        _mapView.delegate = self;
    }
    return self;
}

- (UIView *)getMapView{
    return _mapView;
}

@end
