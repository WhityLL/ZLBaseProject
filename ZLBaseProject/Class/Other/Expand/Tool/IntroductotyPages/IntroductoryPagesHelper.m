//
//  IntroductoryPagesHelper.m
//  ZLBaseProject
//
//  Created by LiuLei on 16/9/9.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import "IntroductoryPagesHelper.h"

@interface IntroductoryPagesHelper ()

@property (nonatomic) UIWindow *rootWindow;
@property (nonatomic ,strong) IntroductoryPagesView *curIntroductoryPagesView;

@end

@implementation IntroductoryPagesHelper

+(instancetype)shareInstance{

    static IntroductoryPagesHelper *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[IntroductoryPagesHelper alloc]init];
    });
    return shareInstance;
    
}

- (instancetype)init{

    if (self = [super init]) {
        
    }
    return self;
    
}

+ (void)showIntroductoryPageView:(NSArray *)imageArray{

    if (![IntroductoryPagesHelper shareInstance].curIntroductoryPagesView) {
        [IntroductoryPagesHelper shareInstance].curIntroductoryPagesView=[[IntroductoryPagesView alloc]initPagesViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT) Images:imageArray];
    }
    
    [IntroductoryPagesHelper shareInstance].rootWindow = [UIApplication sharedApplication].keyWindow;
    [[IntroductoryPagesHelper shareInstance].rootWindow addSubview:[IntroductoryPagesHelper shareInstance].curIntroductoryPagesView];
    
    
}

@end
