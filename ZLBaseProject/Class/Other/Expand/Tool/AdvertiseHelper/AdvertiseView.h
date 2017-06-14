//
//  AdvertiseView.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kAdscreenWidth [UIScreen mainScreen].bounds.size.width
#define kAdscreenHeight [UIScreen mainScreen].bounds.size.height
#define kAdMain_Screen_Bounds [[UIScreen mainScreen] bounds]
#define kAdUserDefaults [NSUserDefaults standardUserDefaults]

static NSString *const adImageName = @"adImageName";

@interface AdvertiseView : UIView

//广告展示时间
@property (nonatomic ,assign) int showtime;

/** 显示广告页面方法*/
- (void)show;

/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;

@end
