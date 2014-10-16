//
//  NSFileManager+RC.m
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-2.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import "NSFileManager+RC.h"

@implementation NSFileManager (RC)



//缓存文件夹路径
+ (NSString *)cacheHomePath
{
    NSString *homePath = NSHomeDirectory();
    return [homePath stringByAppendingPathComponent:@"/Library/Caches"];
}

//图片缓存文件夹
+ (NSString *)imageCachePath
{
    NSString *cachePath = [[self class] cacheHomePath];
    NSString *_imageCachePath = [cachePath stringByAppendingPathComponent:@"images"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    BOOL exist = [fileManager fileExistsAtPath:_imageCachePath isDirectory:&isDir];
    if (!exist) {
        NSError *error;
        [fileManager createDirectoryAtPath:_imageCachePath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"创建缓存图片文件夹失败:%@",error);
            return nil;
        }
    }
    return _imageCachePath;
}

@end
