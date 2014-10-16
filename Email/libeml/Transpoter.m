//
//  Transpoter.m
//  Email
//
//  Created by dy on 14-10-16.
//  Copyright (c) 2014年 dy. All rights reserved.
//

#import "Transpoter.h"

@interface Transpoter ()
{
    BOOL _running;
}

@end


@implementation Transpoter


- (void)start
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @autoreleasepool {
            
            if (!self.host || !self.port) {
                NSLog(@"host或者port不存在");
                return;
            }
            
            _running = YES;
            
            CFReadStreamRef readStream;
            CFWriteStreamRef writeStream;
            CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)self.host, [self.port integerValue], &readStream, &writeStream);
            
            NSInputStream *inputStream = (__bridge_transfer NSInputStream *)readStream;
            NSOutputStream *outputStream = (__bridge_transfer NSOutputStream *)writeStream;
            [inputStream setDelegate:self];
            [outputStream setDelegate:self];
            
            NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
            [inputStream scheduleInRunLoop:currentRunLoop forMode:NSDefaultRunLoopMode];
            [outputStream scheduleInRunLoop:currentRunLoop forMode:NSDefaultRunLoopMode];
            
            self.readStream = inputStream;
            self.outputStream = outputStream;
            
            [inputStream open];
            [outputStream open];
            
            if (_running) {
                [currentRunLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            else
            {
                [self.readStream removeFromRunLoop:currentRunLoop forMode:NSDefaultRunLoopMode];
                [self.readStream close];
                
                [self.outputStream removeFromRunLoop:currentRunLoop forMode:NSDefaultRunLoopMode];
                [self.outputStream close];
            }
        }
        
    });
}

- (void)stop
{
    _running = NO;
}

#pragma mark NSStreamDelegate
- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{

}

@end
