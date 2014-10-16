//
//  UIImage+RC.m
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-5.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import "UIImage+RC.h"

@implementation UIImage (RC)

// 无缓存的加载图片
+ (UIImage *)imageWithResource:(NSString *)name
{
    //加载图片的后缀
    NSString *ofType = nil;
    
    if(!name.pathExtension.length)
    {
        ofType = @"png";
    }
    
    //获取图片路径
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:ofType];
    //获取图片数据
    NSData *data   = [NSData dataWithContentsOfFile:path];
    
    //获取缩放比例
    if([self instancesRespondToSelector:@selector(imageWithData:scale:)])
    {
        return [self imageWithData:data scale:2.0];
    }
    else
    {
        UIImage *image = [self imageWithData:data];
        return [self imageWithCGImage:image.CGImage scale:2.0 orientation:image.imageOrientation];
    }
}

// 将颜色转为图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color size:CGSizeMake(1, 1) radius:0];
}

// 将颜色转换为图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    return [self imageWithColor:color size:size radius:0];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius
{
    return [self imageWithColor:color size:size radius:radius location:0xf];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius location:(NSInteger)location
{
    return [self imageWithSize:size
                  scale:[UIScreen mainScreen].scale
             usingBlock:^(CGContextRef ctx){
                 //填充颜色
                 CGContextSetFillColorWithColor(ctx, color.CGColor);
                 
                 if(radius)
                 {
                     if (radius > MIN(size.height, size.width)/2) {
                         return ;
                     }
                     
                     CGContextMoveToPoint(ctx, radius, size.height);
                     
                     CGContextAddLineToPoint(ctx, size.width-radius, size.height);
                     if (location & 0x2) {//右上
                         CGContextAddArcToPoint(ctx, size.width, size.height, size.width, size.height-radius, radius);
                     }else{
                        CGContextAddLineToPoint(ctx, size.width, size.height);
                        CGContextAddLineToPoint(ctx, size.width, size.height-radius);
                     }

                     CGContextAddLineToPoint(ctx, size.width, radius);
                     if (location & 0x8) {//右下
                        CGContextAddArcToPoint(ctx, size.width, 0, size.width-radius, 0, radius);
                     }else{
                         CGContextAddLineToPoint(ctx, size.width, 0);
                         CGContextAddLineToPoint(ctx, size.width-radius, 0);
                     }
                     
                     CGContextAddLineToPoint(ctx, radius, 0);
                     if (location & 0x4) {//左下
                         CGContextAddArcToPoint(ctx, 0, 0, 0, radius, radius);
                     }else{
                         CGContextAddLineToPoint(ctx, 0, 0);
                         CGContextAddLineToPoint(ctx, 0, radius);
                     }

                     CGContextAddLineToPoint(ctx, 0, size.height-radius);
                     if (location & 0x1) {//左上
                        CGContextAddArcToPoint(ctx, 0, size.height, radius, size.height, radius);
                     }else{
                         CGContextAddLineToPoint(ctx, 0, size.height);
                         CGContextAddLineToPoint(ctx, radius, size.height);
                     }
                     
                     CGContextClosePath(ctx);
                     CGContextFillPath(ctx);
                 }
                 else
                 {
                     CGContextFillRect(ctx,  (CGRect){CGPointZero, size});
                 }
             }];
}

/*
 *! @brief 创建图片的绘画对象
 */
+ (UIImage *)imageWithSize:(CGSize)size scale:(CGFloat)scale usingBlock:(void(^)(CGContextRef ctx))usingBlock;
{
    @autoreleasepool
    {
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        size_t width  = size.width * scale;
        size_t height = size.height * scale;
        
        CGContextRef ctx = CGBitmapContextCreate(NULL,
                                                 width,
                                                 height,
                                                 8,
                                                 width * 4,
                                                 colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
        CGColorSpaceRelease(colorSpace);
        //缩放
        CGContextScaleCTM(ctx, scale, scale);
        
        if(usingBlock)
        {
            usingBlock(ctx);
        }
        
        CGImageRef img = CGBitmapContextCreateImage(ctx);
        UIImage *image = [UIImage imageWithCGImage:img scale:scale orientation:UIImageOrientationUp];
        
        CGImageRelease(img);
        CGContextRelease(ctx);
        
        return image;
    }
}


//用于拉伸图片
+ (UIImage *)imageNamed:(NSString *)name resizableCapInsets:(UIEdgeInsets)capInsets
{
    @autoreleasepool
    {
        UIImage *image = [UIImage imageWithResource:name];
        image          = [image resizableImageWithCapInsets:capInsets];
        return image;
    }
}

+ (UIImage *)imageStretchCenterWithNamed:(NSString *)imageNamed
{
    //载入图片
    UIImage *image = [self imageWithResource:imageNamed];
    if(image)
    {
        image = [image stretchableImageWithLeftCapWidth:image.size.width / 2 topCapHeight:image.size.height / 2 ];
    }
    return image;
}

+ (UIImage *)clearImage
{
    static dispatch_once_t onceToken;
    static UIImage *clearImage = nil;
    dispatch_once(&onceToken, ^{
        clearImage = [self imageWithColor:[UIColor clearColor]];
    });
    return clearImage;
}

//获取图片等比尺寸
- (CGSize)geometricSize:(CGSize)maxSize{
    CGSize size = self.size;
    
    //计算宽度比例
    float widthRate = maxSize.width / size.width;
    
    //计算高度比例
    float heightRate = maxSize.height / size.height;
    
    if(widthRate < heightRate){
        size.width  = maxSize.width;
        size.height*=widthRate;
    }
    else{
        size.height = maxSize.height;
        size.width *= heightRate;
    }
    
    return size;
}

//改变图片的尺寸
- (UIImage *)imageResize:(CGSize)size
{
    return [self.class imageWithSize:size
                               scale:self.scale
                          usingBlock:^(CGContextRef ctx){
                              CGRect rect = (CGRect){CGPointZero, size};
                              CGContextDrawImage(ctx, rect, self.CGImage);
                          }];
}

//改变图片的颜色
- (UIImage *)changeColor:(UIColor *)color
{
    return [self.class imageWithSize:self.size
                               scale:self.scale
                          usingBlock:^(CGContextRef ctx){
                              CGContextSetFillColorWithColor(ctx, color.CGColor);
                              CGContextFillRect(ctx, (CGRect){CGPointZero, self.size});
                              CGContextSetBlendMode(ctx, kCGBlendModeDestinationIn);
                              CGContextDrawImage(ctx, (CGRect){CGPointZero, self.size}, self.CGImage);
                          }];
}

//改变图片的透明度
- (UIImage *)imageWithAlphaComponent:(CGFloat)alpha
{
    return [self.class imageWithSize:self.size
                               scale:self.scale
                          usingBlock:^(CGContextRef ctx){
                              CGContextSetBlendMode(ctx, kCGBlendModeNormal);
                              CGContextSetAlpha(ctx, alpha);
                              CGContextDrawImage(ctx, (CGRect){CGPointZero, self.size}, self.CGImage);
                          }];
}


@end
