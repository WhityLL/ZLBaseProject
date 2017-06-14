//
//  ZL_BaiduMapView.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_BaiduMapView.h"

@interface ZL_BaiduMapView ()<BMKLocationServiceDelegate>{
    
    BMKMapView *_mapView;
    BMKLocationService *locationServer;
}


@end

@implementation ZL_BaiduMapView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super init]) {
        _mapView = [[BMKMapView alloc]initWithFrame:frame];
        locationServer =[[BMKLocationService alloc]init];
    }
    return self;
}

- (UIView *)getMapView{
    return _mapView;
}

- (void)getUserLocaton:(void (^)(CLLocation *))locationBlock{
    
    self.locationBlock = locationBlock;
    //启动定位服务
    [self initLocationService];

}


- (void)initLocationService{
    
    locationServer.delegate = self;
    //设置距离过滤器，大于5米就跟跟新一次，也可以自己判断用户移动距离
    locationServer.distanceFilter = 10;
     //设置精度
    locationServer.desiredAccuracy = kCLLocationAccuracyBest;
    //启动LocationService
    [locationServer startUserLocationService];
}


#pragma mark -  BMKLocationServiceDelegate
/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    NSLog(@"定位成功");
    if (self.locationBlock) {
        self.locationBlock(userLocation.location);
    }
    [locationServer stopUserLocationService];
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}

@end
