//
//  BaseNetManager.m
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "BaseNetManager.h"
#import "AFNetworking.h"
#import <MBProgressHUD.h>
#import "NetworkUnit.h"

#define kTimeoutInterval (appDelegateInstance.requestTimeoutInterval)

#define kLastWindow [UIApplication sharedApplication].keyWindow

@implementation BaseNetManager

/************************* AFHTTPSessionManager  *********************************/
- (AFHTTPSessionManager *)sharedAFManager{
    
    static AFHTTPSessionManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager=[AFHTTPSessionManager manager];
        
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        manager.requestSerializer.timeoutInterval= kTimeoutInterval;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
    });
    return manager;
}

- (AFHTTPSessionManager *)sharedAFManagerWithHeader:(NSDictionary *)header{
    static AFHTTPSessionManager *manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval=kTimeoutInterval;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain", nil];
        //可以用参数 取得字典的key 和value 进一步封装
        [manager.requestSerializer setValue:header[@"apikey"] forHTTPHeaderField:@"apikey"];
    });
    return manager;
}

/**************************** Get/Post withRequestHeader  ******************************/

- (void)GET:(NSString *)path requestHeader:(NSDictionary *)header parameters:(NSDictionary *)params kCompletionHandle
{
    if (header == nil) {
        
        [[self sharedAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            completionHandle(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            completionHandle(nil, error);
        }];
        
    }else{
        [[self sharedAFManagerWithHeader:header] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            completionHandle(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            completionHandle(nil, error);
        }];
    }
}

- (void)POST:(NSString *)path requestHeader:(NSDictionary *)header parameters:(NSDictionary *)params kCompletionHandle
{
    if (header == nil) {
         [[self sharedAFManager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            completionHandle(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            completionHandle(nil, error);
        }];
    }else{
         [[self sharedAFManagerWithHeader:header] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            completionHandle(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            completionHandle(nil, error);
        }];
    }
}

/**************************  华丽的分割线  *********************************/
#pragma mark --  不带请求头
- (void)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    //有网络
    if (appDelegateInstance.currentNetworkStatus) {
        [MBProgressHUD showBusy];
        
        NSLog(@"Get请求地址：%@",path);
        
        [[self sharedAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            [MBProgressHUD hideHUD];
            
            completionHandle(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
            [MBProgressHUD hideHUD];
            
            completionHandle(nil, error);
        }];
    }else{
        [MBProgressHUD showAutoMessage:@"请检查网络连接"];
    }
}

- (void)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle{
    
    if (appDelegateInstance.currentNetworkStatus) {
        [MBProgressHUD showBusy];
        
        [[self sharedAFManager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            
            [MBProgressHUD hideHUD];
            
            
            completionHandle(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
            
            [MBProgressHUD hideHUD];
            
            completionHandle(nil, error);
        }];
    }else{
        [MBProgressHUD showAutoMessage:@"请检查网络连接"];
    }
}

/**************************  上传图片 一张或多张  **********************************/

- (void)POST:(NSString *)path parameters:(NSDictionary *)params file:(NSString *)file fileName:(NSString *)fileName imageDataArray:(NSArray *)dataArrs progress:(void(^)(NSProgress *))progress completionHandle:(void (^)(id, NSError *))completionHandle{
    
    if (appDelegateInstance.currentNetworkStatus) {
    
        [MBProgressHUD showBusy];
        
        [[self sharedAFManager] POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            for(NSInteger i = 0; i < dataArrs.count; i++)
            {
                UIImage *image = [dataArrs objectAtIndex: i];
                
                NSData  *imageData  =UIImageJPEGRepresentation(image, 1.0);
                
                NSString *Name = [NSString stringWithFormat:@"%@%ld",fileName, i+1];
                NSString *fileName = [NSString stringWithFormat:@"%@.jpg", Name];
                //参数名
                NSString *stringName = nil;
                if ([file isEqualToString:@"attachmentPic"]) {
                    stringName =[NSString stringWithFormat:@"%@%ld",file,i+1];
                }else{
                    stringName = file;
                }
                [formData appendPartWithFileData:imageData name:stringName fileName:fileName mimeType:@"image/jpeg"];
            }
            if (dataArrs.count <=0) {
                UIImage * imageDefault =[UIImage imageNamed:@"ic_wondbuy"];
                NSData *imageDataDefalut  =UIImageJPEGRepresentation(imageDefault, 1.0);
                [formData appendPartWithFileData:imageDataDefalut name:@"defaultfile" fileName:[NSString stringWithFormat:@"defaultfile.jpg"] mimeType:@"image/jpeg"];
            }
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            progress(uploadProgress);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [MBProgressHUD hideHUD];
            completionHandle(responseObject, nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [MBProgressHUD hideHUD];
            
            completionHandle(nil, error);
        }];
    }else{
        [MBProgressHUD showAutoMessage:@"请检查网络连接"];
    }
}

@end

