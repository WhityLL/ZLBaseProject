//
//  ZL_MapEngine.h
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZL_MapFactory.h"

@interface ZL_MapEngine : NSObject

+(instancetype)mapEngine;

//定义规范 供给外部使用
- (id<ZL_MapFactory>)getMapFactory;

@end
