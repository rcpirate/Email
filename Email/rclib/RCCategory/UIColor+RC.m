//
//  UIColor+RC.m
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-4.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import "UIColor+RC.h"

@implementation UIColor (RC)

// 将指定的整数转为颜色值
+ (UIColor *)colorWithUInt:(NSUInteger)rgb
{
    return [self colorWithUInt:rgb alpha:1];
}

// 指定整数和颜色的透明度
+ (UIColor *)colorWithUInt:(NSUInteger)rgb alpha:(CGFloat)alpha
{
    //红色
    float r = (rgb >> 16)       / 255.0;
    //绿色
    float g = (rgb >> 8 & 0xff) / 255.0;
    //蓝色
    float b = (rgb & 0xff)      / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

// 直接将指定的资源图片转为颜色值
+ (UIColor *)colorWithResource:(NSString *)name
{
    return [self colorWithPatternImage:[UIImage imageWithResource:name]];
}

//获取颜色模式
- (CGColorSpaceModel)colorSpaceModel
{
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

/**
 *  将当前的颜色转换成图片
 *
 *  @return 将当前的颜色转换成图片
 */
- (UIImage *)image
{
    return [UIImage imageWithColor:self];
}

@end
