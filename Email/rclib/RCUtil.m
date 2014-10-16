//
//  NSString+RCUtil.m
//  RCFrameWork
//
//  Created by dy on 14-6-3.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "RCUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation RCUtil

//取md5值
+ (NSString *)md5:(NSString*)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//guid
+ (NSString *)guidWithBar:(BOOL)hasBar
{
    NSString *string = nil;
    @autoreleasepool
    {
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        
        CFStringRef uuidStr = CFUUIDCreateString(kCFAllocatorDefault, uuid);
        
        if (hasBar) {
            string = (__bridge NSString *)uuidStr;
        }else{
            string = [(__bridge NSString *)uuidStr stringByReplacingOccurrencesOfString:@"-" withString:@""];
        }
        
        CFRelease(uuid);
        CFRelease(uuidStr);
    }
    
    return string;
}

@end

