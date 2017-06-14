//
//  NSObject+MJParse.m
//  BaseProject
//
//  Created by tarena on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NSObject+MJParse.h"


@implementation NSObject (MJParse)
/** MJExtension是从属性名 -> key */
/*
 如果 key 就是 desc, 那么下方代码自动切换为description则出错
 */

+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    if ([propertyName isEqualToString:@"desc"]) {
        propertyName = @"description";
    }
//    .......
    return propertyName;
}

+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

@end

/*
 {"json_res":"{\"raw_text\":\"吃饭\",\"parsed_text\":\"吃饭\",\"results\":[{\"domain\":\"baike\",\"intent\":\"search\",\"score\":1,\"demand\":0,\"update\":1,\"object\":{\"item\":\"吃饭\"}},{\"domain\":\"map\",\"intent\":\"nearby\",\"score\":1,\"demand\":0,\"update\":1,\"object\":{\"keywords\":\"吃饭\"}}]}","item":["吃饭"]}    请问一下这要怎么解析出来OC使用的对象啊
 ==>>
 
json格式字符串转字典：
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonDataoptions:NSJSONReadingMutableContainerserror:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
*/









