//
//  ZL_CollectionReusableView.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/4/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_CollectionReusableView.h"

@interface ZL_CollectionReusableView (){
    UILabel *lb;
}
@end

@implementation ZL_CollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        
        lb = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 20)];
        [self addSubview:lb];
        
    }
    return self;
}

- (void)setStr:(NSString *)str{
    _str = str;
    lb.text = str;
}

@end
