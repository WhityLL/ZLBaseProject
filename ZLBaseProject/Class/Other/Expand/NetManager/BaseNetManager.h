//
//  BaseNetManager.h
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCompletionHandle  completionHandle:(void(^)(id model, NSError *error))completionHandle

@interface BaseNetManager : NSObject

/**
 *  base GET with Header
 *
 *  @param path   URL
 *  @param header 请求头 可为空
 *  @param params 参数
 *
 *  @return 回调
 */
- (void)GET:(NSString *)path requestHeader:(NSDictionary *)header parameters:(NSDictionary *)params kCompletionHandle;

/**
 *  base POST  with Header
 *
 *  @param path   URL
 *  @param header 请求头 可为空
 *  @param params 参数
 *
 *  @return  回调
 */
- (void)POST:(NSString *)path requestHeader:(NSDictionary *)header parameters:(NSDictionary *)params kCompletionHandle;


- (void)GET:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;

- (void)POST:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;



/**
 *  AFNetWorking 上传一张或则多张图片
 *
 *  @param path             URL
 *  @param params           params
 *  @param file             字段名
 *  @param fileName         文件名
 *  @param dataArrs         图片数组
 *  @param progress         传输进度
 *  @param completionHandle 完成回调
 *
 *  @return <#return value description#>
 */
- (void)POST:(NSString *)path
parameters:(NSDictionary *)params
      file:(NSString *)file
  fileName:(NSString *)fileName
imageDataArray:(NSArray *)dataArrs
  progress:(void(^)(NSProgress *))progress
completionHandle:(void (^)(id, NSError *))completionHandle;

@end










