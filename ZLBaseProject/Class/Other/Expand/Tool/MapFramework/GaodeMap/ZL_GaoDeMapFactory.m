//
//  ZL_GaoDeMapFactory.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_GaoDeMapFactory.h"
#import "ZL_GaodeMapView.h"

@implementation ZL_GaoDeMapFactory

- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    return [[ZL_GaodeMapView alloc]initWithFrame:frame];
}

@end
