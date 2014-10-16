//
//  RCProgressView.h
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-3.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCProgressView : UIView
{
    
}

//进度值 0-1.0
@property (nonatomic) CGFloat progress;

//轨道颜色
@property (nonatomic) UIColor *trackColor;

//进度条颜色
@property (nonatomic) UIColor *tinColor;

@end
