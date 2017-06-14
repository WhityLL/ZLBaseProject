//
//  UIButton+Indicator.m
//  UIButton Indicator
//
//  Copyright (c) 2015 Jeremiah Poisson
//

#import "UIButton+Indicator.h"
#import <objc/runtime.h>

//运行时加属性方法一
// Associative reference keys.
//static NSString *const kIndicatorViewKey = @"indicatorView";
//static NSString *const kButtonTextObjectKey = @"buttonTextObject";

//运行时加属性方法二
@interface UIButton ()

@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,strong) UIActivityIndicatorView  *indicator;

@end

@implementation UIButton (Indicator)

- (void) showIndicator {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    self.indicator = indicator;
    [indicator startAnimating];
    
    self.title = self.titleLabel.text;
    
//    //运行时加属性
//    objc_setAssociatedObject(self, &kButtonTextObjectKey, currentButtonText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    objc_setAssociatedObject(self, &kIndicatorViewKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setTitle:@"" forState:UIControlStateNormal];
    self.enabled = NO;
    [self addSubview:indicator];
    
    
}

- (void) hideIndicator {
    
//    NSString *currentButtonText = (NSString *)objc_getAssociatedObject(self, &kButtonTextObjectKey);
//    UIActivityIndicatorView *indicator = (UIActivityIndicatorView *)objc_getAssociatedObject(self, &kIndicatorViewKey);
    
    [self.indicator removeFromSuperview];
    [self setTitle:self.title forState:UIControlStateNormal];
    self.enabled = YES;
    
}


//运行时加属性方法二
- (NSString *)title{
    return objc_getAssociatedObject(self, @selector(setTitle:));
}

- (void)setTitle:(NSString *)title{
    objc_setAssociatedObject(self, @selector(setTitle:), title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIActivityIndicatorView *)indicator{
    return objc_getAssociatedObject(self, @selector(setIndicator:));
}

- (void)setIndicator:(UIActivityIndicatorView *)indicator{
    objc_setAssociatedObject(self, @selector(setIndicator:), indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
