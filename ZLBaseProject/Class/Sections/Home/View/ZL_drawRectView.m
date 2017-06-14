//
//  ZL_drawRectView.m
//  ZLBaseProject
//
//  Created by LiuLei on 2017/5/10.
//  Copyright © 2017年 LiuLei. All rights reserved.
//

#import "ZL_drawRectView.h"

@interface ZL_drawRectView ()
@property (nonatomic ,strong) UISlider *slider;
@property (nonatomic ,assign) float progress;
@end

@implementation ZL_drawRectView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        
        self.userInteractionEnabled = YES;
        
        self.progress = 0.2;
        
        self.slider.value = self.progress;
        
        
    }
    return self;
}

//划线
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    NSLog(@"%s",__func__);
//    //1.获取上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    //2.描述路径
//    UIBezierPath * path = [UIBezierPath bezierPath];
//    //起点
//    [path moveToPoint:CGPointMake(10, 10)];
//    //终点
//    [path addLineToPoint:CGPointMake(100, 100)];
//    //设置颜色
//    [[UIColor whiteColor]setStroke];
//    //3.添加路径
//    CGContextAddPath(contextRef, path.CGPath);
//    //显示路径
//    CGContextStrokePath(contextRef);
//}

//划矩形
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    //1.获取上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    //2.描述路径
//    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 100, 100)];
//    
//    //3.添加路径
//    CGContextAddPath(contextRef, path.CGPath);
//    
////    //设置描边颜色
////    [[UIColor redColor]setStroke];
////    //显示描边路径
////    CGContextStrokePath(contextRef);
//    
//    //设置填充颜色
//    [[UIColor greenColor]set];
//    //显示路径
//    CGContextFillPath(contextRef);
//    
//}

//画文字
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    //1.获取当前上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    //2.创建文字
//    NSString * str = @"纸巾艺术 啊胡说八道急哈比三家烧烤的啊剋背带裤啊手机卡死的aks";
//    //设置字体样式
//    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
//    //NSFontAttributeName:字体大小
//    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
//    //字体前景色
//    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
//    //字体背景色
//    dict[NSBackgroundColorAttributeName] = [UIColor redColor];
//    //字体阴影
//    NSShadow * shadow = [[NSShadow alloc]init];
//    //阴影偏移量
//    shadow.shadowOffset = CGSizeMake(2, 2);
//    //阴影颜色
//    shadow.shadowColor = [UIColor greenColor];
//    //高斯模糊
//    shadow.shadowBlurRadius = 5;
//    dict[NSShadowAttributeName] = shadow;
//    //字体间距
//    dict[NSKernAttributeName] = @10;
//    //绘制到上下文
//    //从某一点开始绘制 默认 0 0点
////    [str drawAtPoint:CGPointMake(100, 100) withAttributes:dict];
//    //绘制区域设置
//    [str drawInRect:rect withAttributes:dict];
//    //添加到上下文
//    CGContextStrokePath(contextRef);
//}


//绘制图片
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    //1.获取当前的上下文
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    //2.加载图片
//    //这里顺便咯嗦一句：使用imageNamed加载图片是会有缓存的
//    //我们这里只需要加载一次就够了，不需要多次加载，所以不应该保存这个缓存
//    //    UIImage * image = [UIImage imageNamed:@"222"]; //所以可以换一种方式去加载
//    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mycity_highlight" ofType:nil]];
//    
//    
//    //    //绘制的大小位置
//    //    [image drawInRect:rect];
//    
//    
//    //    //从某个点开始绘制
//    //    [image drawAtPoint:CGPointMake(0, 0)];
//    
//    
//    //绘制一个多大的图片，并且设置他的混合模式以及透明度
//    //Rect：大小位置
//    //blendModel：混合模式
//    //alpha：透明度
//    [image drawInRect:rect blendMode:kCGBlendModeNormal alpha:1];
//    
//    
//    //从某一点开始绘制图片，并设置混合模式以及透明度
//    //point:开始位置
//    //blendModel：混合模式
//    //alpha：透明度
//    //    [image drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeNormal alpha:1];
//    
//    //添加到上下文
//    CGContextFillPath(contextRef);
//}

- (void)drawRect:(CGRect)rect {
    
    CGFloat startA = - M_PI_2;
    CGFloat endA =  - M_PI_2 + self.progress * M_PI * 2;
    NSLog(@"%f - %f - %f",self.progress,(3.14159265359*self.progress)/180,endA);
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5) radius:self.bounds.size.width*0.5-10 startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor colorWithRed:self.progress green:(1-self.progress) blue:0 alpha:1]setStroke];
    path.lineWidth = 5;
    [path stroke];
    
}

- (UISlider *)slider{
    if (!_slider) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 10, 300, 10)];
        [_slider addTarget:self action:@selector(slider:) forControlEvents:(UIControlEventValueChanged)];
        _slider.maximumValue = 1;
        _slider.minimumValue = 0;
        
        _slider.minimumTrackTintColor = [UIColor redColor];
        _slider.maximumTrackTintColor = [UIColor blueColor];
        
        [self addSubview:_slider];
    }
    return _slider;
}
- (void)slider:(UISlider *)sender{
    self.progress = sender.value;
    
    //自动重写 drawRect 方法
    [self setNeedsDisplay];
    
}

@end
