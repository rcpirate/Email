//
//  RCProgressView.m
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-3.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import "RCProgressView.h"

#define defaultProgressFrame CGRectMake(0,0,36,36)

@implementation RCProgressView

- (id)init
{
    self = [super init];
    if (self) {
        self.frame = defaultProgressFrame;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentMode = UIViewContentModeRedraw;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    
    if (progress > 1.0) {
        progress = 1.0;
    }else if (progress < 0.0)
    {
        progress = 0.0;
    }
    
    if (progress == self.progress) {
        return;
    }
    
    _progress = progress;
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    
    //首先确定进度条的位置
    if (rect.size.height < defaultProgressFrame.size.height || rect.size.width < defaultProgressFrame.size.width) {
        return;
    }
    CGRect rect0 = CGRectMake((rect.size.width - CGRectGetWidth(defaultProgressFrame))/2,
                              (rect.size.height - CGRectGetHeight(defaultProgressFrame))/2,
                              CGRectGetWidth(defaultProgressFrame),
                              CGRectGetHeight(defaultProgressFrame));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(context, rect0);
    
    CGRect rect1 = CGRectInset(rect0, 4, 4);
    
    CGContextAddEllipseInRect(context, rect1);
    
    if (!self.trackColor) {
        self.trackColor = [UIColor colorWithWhite:.5 alpha:.25];
    }
    //画轨道
    CGContextSetFillColorWithColor(context, self.trackColor.CGColor);
    CGContextEOFillPath(context);
    
    
    CGContextSetLineCap(context, kCGLineCapRound);
    if (self.progress == 1) {
        CGContextAddEllipseInRect(context, CGRectInset(rect0, .5, .5));
        CGContextAddEllipseInRect(context, CGRectInset(rect0, 3.0, 3.0));
    }
    else
    {
        CGFloat r = CGRectGetWidth(rect0)/2.0 - 0.5;//弧线半径
        CGFloat midX = CGRectGetMidX(rect0);//弧线中心点x
        CGFloat midY = CGRectGetMidY(rect0);//弧线中心点y
        
        CGFloat startAngle = - M_PI_2;//开始弧度（x轴为0度）
        CGFloat endAngle = startAngle - 2*(1-self.progress)*M_PI;
        
        CGContextAddArc(context, midX, midY, r, startAngle, endAngle, 0);
        
        r -= 3.0;
        
        CGContextAddArc(context, midX, midY, r, endAngle, startAngle, 1);

    }
    
    if (!self.tinColor) {
        self.tinColor = [UIColor whiteColor];
    }
    
    //画进度
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextEOFillPath(context);
}


@end
