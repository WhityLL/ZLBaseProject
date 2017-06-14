//
//  ZL_BaiduMapView.h
//  ZLBaseProject
//
//  Created by LiuLei on 2017/2/24.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"

typedef void(^UserLocationBlock)(CLLocation *location);

@interface ZL_BaiduMapView : NSObject<IMapView>

@property (nonatomic ,copy) UserLocationBlock locationBlock;

@end
