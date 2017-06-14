//
//  Person.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/10/8.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic ,strong) NSString *name;

@property (nonatomic ,assign) NSInteger age;

+(instancetype)person;

@end
