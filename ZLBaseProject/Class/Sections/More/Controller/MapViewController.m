//
//  MapViewController.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/23.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "MapViewController.h"
@interface MapViewController ()<BMKLocationServiceDelegate>{
//    /*BMKMapView*/  MAMapView       *_mapView;
    BMKMapView  /*MAMapView*/     *_mapView;
    BMKLocationService *locationServer;
}

@end

@implementation MapViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    //获取地图
    ZL_MapEngine *mapEngine = [[ZL_MapEngine alloc]init];
    id<ZL_MapFactory> factory = [mapEngine getMapFactory];
    id<IMapView> ZL_mapView = [factory getMapViewWithFrame:self.view.bounds];
    _mapView = (BMKMapView*)[ZL_mapView getMapView];
    [self.view addSubview:_mapView];
    
//    [self initLocationService];
    
    [ZL_mapView getUserLocaton:^(CLLocation *location) {
       
        NSLog(@"didUpdateUserLocation lat %f,long %f",location.coordinate.latitude,location.coordinate.longitude);
        
    }];
}

- (void)initLocationService{
    
    locationServer =[[BMKLocationService alloc]init];
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
    [locationServer stopUserLocationService];
    _mapView.showsUserLocation = YES;//显示定位图层
    [_mapView updateLocationData:userLocation];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
