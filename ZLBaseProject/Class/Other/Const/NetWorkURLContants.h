//
//  NetWorkURLContants.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/29.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#ifndef NetWorkURLContants_h
#define NetWorkURLContants_h

//网络状态监控地址
static NSString* const kURL_Reachability__Address=@"www.baidu.com";

#import "NetManager.h"

//#import "WXApi.h"
//#import "WXApiManager.h"
//#import "AppMethod.h"
//#import "WXApiRequestHandler.h"
//#import "WXApiResponseHandler.h"
//
//
//#import <AlipaySDK/AlipaySDK.h>
//#import "AlipayHelper.h"

#pragma mark - SDK宏定义
#pragma mark ---- 微信
//WeChat
#define kWXAppID         @"wx7725a16b9b31b490"
#define kWXAppSecret     @"84684b534306ca58feeaefc76bb6ae87"
#define WeChatMCH_ID     @"1310945501"                      //商户号
#define WeChatPARTNER_ID @"e10adc3949ba59abbe56e057f20f883c"//商户API密钥
#define WeChatNOTIFY_URL @"http://121.40.35.3/test"         //支付结果回调页面


#pragma mark ---   支付宝
#define AlipayPARTNERID  @"2088121904830084"
#define AlipaySELLER     @"88068400@163.com"
#define AlipayRSA_PRIVATE    @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMXvZH8oviC6zh38lX+/1gwSm6lR4SNm+jgCWkLA/FoDssoXBnR517IqDqlZ5+FlcCXGnJDP2gnbGhrFamNlRJFqrPTvj5utc8En8rG17zPFE+nas6A2YJBtI/GN1ci1djp6a6yi6mxLK/HkFbHMT5HVUvcSVOchl6t9qLtG5GENAgMBAAECgYBt3CRka6GzmtuCS0pTAI/2XXGmdfrG4oYpBi1A9cpaz8ixYDxF88ajbbJ7jpokQWAQp38I5US4ybJgf4hAKNn3/aFiGXdsJ3BoSFo5/H6oQ7tT2qZpih/kZ4qvWo3x8i3i0T9jv80QupAXsctzF0Q6FB5JEU8R+4s/kBnWs7dA4QJBAPNNWrfmrN+pMncaOMvkZLle7eEtAajW8xlSfNRuZjUxzTzOr996vCxmds5VquwLH/NBM1BrU6fynD41+NS+66UCQQDQQ+ka7YwJTlP9fZ50sHzBzIHs4lPdLJ0Dwzgeu2Q3pwa9v79Ab5tY5A0bJadMNDEwbsgv5e97qbmRNB4S+0NJAkBVYPHS0xobKq7Q6NzBgBZwjoV/nWGVtEh+vFmd2lf3ltBk5EsHa3SZSCOs6JcgWg8ON/Uf5Wnn59U4Z4w4a/8ZAkAyceCKdzNOJbzOT5kL5puxTVnDCOcLUX0OpkB3oSgbGsfVOhaXAvF7zHEoPCyTlqi7dHnksCsbpvadpyQJsPaRAkEAq61/96OleUUjpU4/6h4m+mfdIhkxxnsswUxerf4dPmgd44IB38La44YArW2eBXYCxUE7BX0/fBnsoomW230RzQ=="
#define AlipayRSA_PUBLIC     @""         // app端不需要公钥
//#define AlipayBackURL @"http://121.40.35.3/test" //获取服务器端支付数据地址（商户自定义）

#endif /* NetWorkURLContants_h */
