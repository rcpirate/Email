//
//  NSFileManager+RC.h
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-2.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (RC)



//缓存文件夹路径
+ (NSString *)cacheHomePath;

//图片缓存文件夹,如果部存在就创建
+ (NSString *)imageCachePath;

@end
