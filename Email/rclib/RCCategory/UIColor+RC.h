//
//  UIColor+RC.h
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-4.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RC)


// rgb 数值,写法为0xAABBCC
+ (UIColor *)colorWithUInt:(NSUInteger)rgb;


//rgb 颜色色值   alpha 透明度
+ (UIColor *)colorWithUInt:(NSUInteger)rgb alpha:(CGFloat)alpha;

//name 图片的文件名
+ (UIColor *)colorWithResource:(NSString *)name;


//获取颜色的模式
- (CGColorSpaceModel)colorSpaceModel;


//将当前的颜色转换成图片
- (UIImage *)image;




@end
