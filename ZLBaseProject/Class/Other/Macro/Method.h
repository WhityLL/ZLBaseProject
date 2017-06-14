//
//  Method.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#ifndef Method_h
#define Method_h

#import "Constants.h"

//************************ NSUserDefaults 实例化 取值************************************

#define USERDEFAULT [NSUserDefaults standardUserDefaults]

#define USERDEFAULT_value(key) [[NSUserDefaults standardUserDefaults] valueForKey:key]

#define USERDEFAULT_object(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define USERDEFAULT_BOOL(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define USERDEFAULT_integer(key) [[NSUserDefaults standardUserDefaults] integerForKey:key]

#define USERDEFAULT_int(key) [[[NSUserDefaults standardUserDefaults] objectForKey:key] intValue]

//************************ NSUserDefaults 实例化 取值************************************

//************************ NSUserDefaults 实例化 存值************************************

//NSUserDefaults 实例化 存值
// object
#define USERDEFAULT_SET_value(_value_,_key_) [[NSUserDefaults standardUserDefaults] setValue:_value_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

#define USERDEFAULT_SET_object(_object_,_key_) [[NSUserDefaults standardUserDefaults] setObject:_object_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

// int
#define USERDEFAULT_SET_int(_int_,_key_) NSString *uIntString=[NSString stringWithFormat:@"%d",_int_];\
[[NSUserDefaults standardUserDefaults] setObject:uIntString forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

//float
#define USERDEFAULT_SET_float(_float_,_key_) NSString *uFloatString=[NSString stringWithFormat:@"%f",_float_];\
[[NSUserDefaults standardUserDefaults] setObject:uFloatString forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

#define USERDEFAULT_SET_bool(_bool_,_key_)   [[NSUserDefaults standardUserDefaults]setBool:_bool_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize];

//************************ NSUserDefaults 实例化 存值************************************


//************************  获取图片资源*************************************************

#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//************************  获取图片资源 ***********************************************


#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"--[方法名:%s]\n---[行号:%d]\n---打印内容:%s\n\n",__FUNCTION__, __LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif


#endif /* Method_h */
