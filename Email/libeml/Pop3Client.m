//
//  Pop3Client.m
//  Email
//
//  Created by dy on 14-10-16.
//  Copyright (c) 2014年 dy. All rights reserved.
//

/*
USER    [username]
PASS    [password]
APOP    [Name,Digest]
STAT    处理请求服务器发回关于邮箱的统计资料，如邮件总数和总字节数
UIDL    [Msg#]处理返回邮件的唯一标识符，POP3会话的每个标识符都将是唯一的
LIST    [Msg#]处理返回邮件数量和每个邮件的大小
RETR    [Msg#]处理返回由参数标识的邮件的全部文本
DELE    [Msg#]处理服务器将由参数标识的邮件标记为删除，由quit命令执行
RSET    处理服务器将重置所有标记为删除的邮件，用于撤消DELE命令
TOP     [Msg# n]处理服务器将返回由参数标识的邮件前n行内容，n必须是正整数
NOOP    处理服务器返回一个肯定的响应
QUIT    终止会话
*/


#import "Pop3Client.h"

@interface Pop3Client ()

@end



@implementation Pop3Client


- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable://有数据可读
        {
            break;
        }
        caseNSStreamEventHasSpaceAvailable://可写数据
        {
            NSString *username = @"renchao1@2980.com";
            
            const uint8_t *cusername = (uint8_t *)[username UTF8String];
            
            [self.outputStream write:cusername maxLength:strlen(cusername)];
            
            break;
        }
        case NSStreamEventErrorOccurred://发生错误
        {
            break;
        }
        case NSStreamEventEndEncountered://
        {
            break;
        }
        default:
            break;
    }
}

- (void)request
{
    [self start];
}

@end
