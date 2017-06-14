//
//  IntroductoryPagesHelper.h
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntroductoryPagesView.h"

@interface IntroductoryPagesHelper : NSObject

+ (instancetype)shareInstance;

+(void)showIntroductoryPageView:(NSArray *)imageArray;

@end
