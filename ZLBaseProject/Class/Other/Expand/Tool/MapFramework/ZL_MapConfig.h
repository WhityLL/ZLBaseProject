//
//  MapConfig.h
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/23.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    Baidu = 0,
    GaoDe = 1
}ZL_MapType;

@interface ZL_MapConfig : NSObject

///单利模式
+(instancetype)configMap;

///设置地图类型
- (void)setMapTypeWith:(ZL_MapType)type;

///设置地图类型(供外部获取)
@property (nonatomic ,assign) ZL_MapType  ZL_MapType;

@end
