//
//  BaseView.m
//  basicFramework
//
//  Created by LiuLei on 2017/2/21.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    
    self = [super init];
    if (self) {
        
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}

- (void)bindViewModel {
}

- (void)setupViews {
}

- (void)addReturnKeyBoard{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end
