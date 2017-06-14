//
//  NetManager.h
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "BaseNetManager.h"

@interface NetManager : BaseNetManager

+ (instancetype)manager;

/** GET 网络请求带请求头   (block回调,返回值为空，参数为id类型的model)*/
- (void)GETPath:(NSString *)path paras:(NSDictionary *)paras requestHeader:(NSDictionary *)header completionHandle:(void(^)(id model,NSError *error))completionHandle;


/** POST 网络请求带请求头条  block回调，返回值为空，参数为id类型的model*/
- (void)POSTPath:(NSString *)path paras:(NSDictionary *)paras requestHeader:(NSDictionary *)header completionHandle:(void(^)(id model,NSError *error))completionHandle;



/** GET网络请求，  block回调，返回值为空，参数为id类型的model*/
- (void)GETPath:(NSString *)path paras:(NSDictionary *)paras completionHandle:(void(^)(id model,NSError *error))completionHandle;

/** POST网络请求  block回调，返回值为空，参数为id类型的model*/
- (void)POSTPath:(NSString *)path paras:(NSDictionary *)paras completionHandle:(void(^)(id model,NSError *error))completionHandle;

/**
 *  上传一张或则多张图片
 *
 *  @param path             URL
 *  @param params           params
 *  @param file             字段名
 *  @param fileName         文件名
 *  @param dataArrs         图片数组
 *  @param progress         传输进度
 *  @param completionHandle 完成回调
 *
 *  @return 
 */
- (void)POSTPath:(NSString *)path
         paras:(NSDictionary *)paras
          file:(NSString *)file
      fileName:(NSString *)fileName
imageDataArray:(NSArray *)dataArr
      progress:(void(^)(NSProgress *progress))progressBlock
completionHandle:(void(^)(id model,NSError *error))completionHandle;

@end
