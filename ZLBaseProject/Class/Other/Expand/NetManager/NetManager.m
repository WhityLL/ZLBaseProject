//
//  NetManager.m
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "NetManager.h"

#define reqBaseUrl @"http:www.baidu.com/"

@implementation NetManager

+ (instancetype)manager{
    return [[self alloc] init];
}

- (void)GETPath:(NSString *)path paras:(NSDictionary *)paras requestHeader:(NSDictionary *)header completionHandle:(void (^)(id, NSError *))completionHandle
{
     [self GET:path requestHeader:header parameters:paras completionHandle:^(id model, NSError *error) {
        completionHandle(model , error);
    }];
}

- (void)POSTPath:(NSString *)path paras:(NSDictionary *)paras requestHeader:(NSDictionary *)header completionHandle:(void (^)(id, NSError *))completionHandle
{
    [self POST:path requestHeader:header parameters:paras completionHandle:^(id model, NSError *error) {
        completionHandle(model  ,  error);
    }];
}


- (void)GETPath:(NSString *)path paras:(NSDictionary *)paras completionHandle:(void(^)(id model,NSError *error))completionHandle{
    [self GET:[NSString stringWithFormat:@"%@%@",reqBaseUrl,path] parameters:paras completionHandle:^(id responseObj, NSError *error) {
        /**处理如果存在，先校验错误码**/
        if([responseObj isKindOfClass:[NSDictionary class]]){
            completionHandle(responseObj,error);
        }else{
            /**处理服务器请求链接不存在**/
            if(error.code ==-1011){
                NSError *aError = [NSError errorWithDomain:@"服务器请求出错!(not found!)" code:error.code  userInfo:error.userInfo];
                completionHandle(responseObj,aError);
            }
            else{
                completionHandle(responseObj,error);
            }
            
        }
    }];
}

- (void)POSTPath:(NSString *)path paras:(NSDictionary *)paras completionHandle:(void(^)(id model,NSError *error))completionHandle{
    
    [self POST:[NSString stringWithFormat:@"%@%@",reqBaseUrl,path]  parameters:paras completionHandle:^(id responseObj, NSError *error) {
        completionHandle(responseObj,error);
    }];
    
}

/*POST upload pic*/
- (void)POSTPath:(NSString *)path paras:(NSDictionary *)paras file:(NSString *)file fileName:(NSString *)fileName imageDataArray:(NSArray *)dataArr progress:(void(^)(NSProgress *))progressBlock completionHandle:(void(^)(id model,NSError *error))completionHandle{
    [self POST:[NSString stringWithFormat:@"%@%@",reqBaseUrl,path]  parameters:paras file:file fileName:fileName imageDataArray:dataArr progress:^(NSProgress * progress) {
        progressBlock(progress);
    } completionHandle:^(id responseObj, NSError *error) {
        completionHandle(responseObj,error);
    }];
}

@end
