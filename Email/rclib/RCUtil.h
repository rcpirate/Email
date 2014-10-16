//
//  NSString+RCUtil.h
//  RCFrameWork
//
//  Created by dy on 14-6-3.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCUtil : NSObject

//取md5值
+ (NSString *)md5:(NSString*)str;

//guid
+ (NSString *)guidWithBar:(BOOL)hasBar;

@end




