//
//  UIImage+Image.h
//  BaseProject
//
//  Created by LiuLei on 16/5/17.
//  Copyright © 2016年 LiuLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象
// UIImage *

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

/**
 * 返回一张圆形图片
 */
- (UIImage *)circleImage;

+(UIImage *)imageWithNamed:(NSString *)name;

/**
 * 返回一张自由拉伸的图片
 */
+(UIImage *)resizeImageWithName:(NSString *)name;

/**
 *  给定一个尺寸，颜色，返回一张图片
 */
+ (UIImage *)buttonImageWithSize:(CGSize )size FromColor:(UIColor *)color;



/*
 *image 渐变图片
 */
+ (UIImage*) BgImageFromColors:(NSArray*)colors withFrame: (CGRect)frame;


/**
 *  图片压缩到指定大小
 *
 *  @param targetSize <#targetSize description#>
 *
 *  @return <#return value description#>
 */
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
@end
