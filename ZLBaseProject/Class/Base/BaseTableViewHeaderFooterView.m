//
//  YDTableViewHeaderFooterView.m
//  YiDing
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "BaseTableViewHeaderFooterView.h"

@implementation BaseTableViewHeaderFooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews{}

@end
