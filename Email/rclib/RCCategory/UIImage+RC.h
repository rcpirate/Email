//
//  UIImage+RC.h
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-5.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, kRoundLocation) {
    kRoundLocationLeftUp = 1,
    kRoundLocationRightUp = 2,
    kRoundLocationLeftDown = 4,
    kRoundLocationRightDown = 8
};

@interface UIImage (RC)

/*
 *没有缓存加载图片
 *使用这方法调用的图片不再需要使用@2x的图片
 */
+ (UIImage *)imageWithResource:(NSString *)name;

// 将颜色转为图片
+ (UIImage *)imageWithColor:(UIColor *)color;

// 将颜色转换为图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius location:(NSInteger)location;

+ (UIImage *)imageStretchCenterWithNamed:(NSString *)imageNamed;

//拉伸图片
+ (UIImage *)imageNamed:(NSString *)name resizableCapInsets:(UIEdgeInsets)capInsets;

/*! @breif 创建图片的绘画对象
 *  @param size 绘画图片的尺寸
 *  @param scale 绘画图片的缩放比例
 *  @param useingBlock 绘画回调
 */
+ (UIImage *)imageWithSize:(CGSize)size scale:(CGFloat)scale usingBlock:(void(^)(CGContextRef ctx))usingBlock;

/**
 *  透明图片
 *
 *  @return 透明图片
 */
+ (UIImage *)clearImage;

//计算图片等比压缩比例
- (CGSize)geometricSize:(CGSize)maxSize;

//改变图片的尺寸
- (UIImage *)imageResize:(CGSize)size;

//改变图片的颜色
- (UIImage *)changeColor:(UIColor *)color;

//改变图片的透明度
- (UIImage *)imageWithAlphaComponent:(CGFloat)alpha;


@end
