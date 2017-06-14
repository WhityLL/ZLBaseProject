//
//  ZL_MapEngine.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_MapEngine.h"
#import "ZL_MapConfig.h"
#import "ZL_BaiDuMapFactory.h"
#import "ZL_GaoDeMapFactory.h"

@implementation ZL_MapEngine

+ (instancetype)mapEngine{

    static ZL_MapEngine *mapEngine = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        mapEngine = [[ZL_MapEngine alloc]init];
        
    });
    return mapEngine;
    
}

- (id<ZL_MapFactory>)getMapFactory{
    
    if ([ZL_MapConfig configMap].ZL_MapType == 0) {
        return [[ZL_BaiDuMapFactory alloc]init];
    }else{
        return [[ZL_GaoDeMapFactory alloc]init];
    }
}

@end
