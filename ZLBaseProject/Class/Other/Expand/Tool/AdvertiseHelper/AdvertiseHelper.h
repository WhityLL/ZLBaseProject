//
//  AdvertiseHelper.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdvertiseView.h"

@interface AdvertiseHelper : NSObject

+ (instancetype)sharedInstance;

+(void)showAdvertiserView:(NSArray *)imageArray;

@end

/**
 *   需加入网络请求数据的其它部分 比如广告时长…… 传给advertiseView
 *   保存的数据 可能是一个对象 包括图片，广告链接
 */

//  ZLBaseProject  处理事件在AdvertiseView里面有个NotificationContants_Advertise_Key通知，可以在首页进行获取通知，然后进行处理，比如进行跳转功能
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:NotificationContants_Advertise_Key object:nil];

