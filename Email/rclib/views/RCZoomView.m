//
//  RCZoomView.m
//  RCFrameWork
//
//  Created by dy on 14-6-3.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "RCZoomView.h"
#import "RCUtil.h"
#import "NSFileManager+RC.h"

@implementation RCZoomView

@synthesize imgUrl = _imgUrl;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (NSString *)imgUrl
{
    return _imgUrl;
}

- (void)setImgUrl:(NSString *)imgUrl
{
    _imgUrl = imgUrl;
    if (imgUrl) {
        NSString *md5Url = [RCUtil md5:imgUrl];
        NSString *cachePath = [[NSFileManager cacheHomePath] stringByAppendingString:[NSString stringWithFormat:@"/%@",md5Url]];
        
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:cachePath]) {
            _image = [UIImage imageWithContentsOfFile:cachePath];
        }
        else//缓存文件夹中没有，则网络请求
        {
            
        }
    }
    
}

@end
