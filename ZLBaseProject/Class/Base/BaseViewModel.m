//
//  BaseViewModel.m
//  basicFramework
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

@synthesize netManager  = _netManager;

+ (instancetype)alloc {

    BaseViewModel *viewModel =[super alloc];
    if (viewModel) {
        
        [viewModel initialize];
    }

    return viewModel;

}

- (instancetype)initWithModel:(id)model {
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (NetManager *)netManager{

    if (!_netManager) {
        _netManager = [NetManager manager];
    }

    return _netManager;
}

- (void)initialize{

}

@end
