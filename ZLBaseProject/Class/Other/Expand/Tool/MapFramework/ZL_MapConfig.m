//
//  MapConfig.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/23.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_MapConfig.h"

@interface ZL_MapConfig (){
    

}
@end

@implementation ZL_MapConfig

+ (instancetype)configMap{
    
    static ZL_MapConfig *configMap = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        configMap = [[ZL_MapConfig alloc]init];
    });
    return configMap;
}



- (void)setMapTypeWith:(ZL_MapType)type{

    if (type == Baidu) {
        BMKMapManager* _mapManager = [[BMKMapManager alloc]init];
        // 如果要关注网络及授权验证事件，请设定   generalDelegate参数
        BOOL ret = [_mapManager start:@"hIcfPSwwUEwHV30OjOlaZh0k5UTXd9VS"  generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }else
        if (type == GaoDe) {
            //高德
            [AMapServices sharedServices].apiKey =@"3bd171159a7f4d9e523b1331b6bc2357";
        }
    
    _ZL_MapType = type;
}

@end
