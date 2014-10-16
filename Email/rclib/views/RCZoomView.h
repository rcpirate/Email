//
//  RCZoomView.h
//  RCFrameWork
//
//  Created by dy on 14-6-3.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCZoomView : UIScrollView

@property(nonatomic,strong) UIView *contentView;

@property(nonatomic) BOOL canZoom;

@property(nonatomic,strong) UIImage *image;

@property(nonatomic,strong) UIImage *placeImage;

@property(nonatomic,strong) NSString *imgUrl;

@end
