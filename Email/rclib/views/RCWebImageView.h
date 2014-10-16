//
//  RCWebImageView.h
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-4.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCWebImageView : UIImageView

- (void)setImageWithURL:(NSURL *)url;

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage;

@end
