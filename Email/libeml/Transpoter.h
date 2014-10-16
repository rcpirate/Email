//
//  Transpoter.h
//  Email
//
//  Created by dy on 14-10-16.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transpoter : NSObject <NSStreamDelegate>

@property(nonatomic)NSString *host;

@property(nonatomic)NSNumber *port;

@property(nonatomic)NSNumber *buffSize;//缓冲大小

@property(nonatomic)NSInputStream *readStream;

@property(nonatomic)NSOutputStream *outputStream;


- (void)start;

- (void)stop;

@end
