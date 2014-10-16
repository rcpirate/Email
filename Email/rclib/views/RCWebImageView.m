//
//  RCWebImageView.m
//  RCFrameWork
//
//  Created by rcpiprate on 14-10-4.
//  Copyright (c) 2014年 rcpiprate. All rights reserved.
//

#import "RCWebImageView.h"
#import "RCProgressView.h"


@interface RCWebImageView()
{
    RCProgressView *_progressView;
    AFHTTPRequestOperation *_httpRequest;
}

@property (nonatomic,strong) RCProgressView *progressView;

@property (nonatomic,strong) AFHTTPRequestOperation *httpRequest;

@end

@implementation RCWebImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.progressView = [[RCProgressView alloc] initWithFrame:self.bounds];
        self.progressView.hidden = YES;
        [self addSubview:_progressView];
    }
    return self;
}

- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
{
    if (!url) {
        return;
    }
    
    if (placeholderImage) {
        self.image = placeholderImage;
    }
    
    _progressView.hidden = NO;
    
     _httpRequest = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url]];
    
    __weak typeof(self) weakSelf = self;
    //下载过程处理
    [_httpRequest setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        CGFloat progress = (double)totalBytesRead/totalBytesExpectedToRead;
        weakSelf.progressView.progress = progress;
    }];
    _httpRequest.responseSerializer = [AFImageResponseSerializer serializer];
    //下载完处理
    [_httpRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[UIImage class]]) {
            weakSelf.image = (UIImage *)responseObject;
        }
        else
        {
            NSLog(@"解析返回的对象不是UIImage");
        }
        weakSelf.progressView.hidden = YES;
        weakSelf.httpRequest = nil;
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (error) {
            NSLog(@"下载图片出错,地址：%@",operation.request);
        }
    }];
    
    [[[self class] sharedImageRequestOperationQueue] addOperation:_httpRequest];

}

+ (NSOperationQueue *)sharedImageRequestOperationQueue {
    static NSOperationQueue *_af_sharedImageRequestOperationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _af_sharedImageRequestOperationQueue = [[NSOperationQueue alloc] init];
        _af_sharedImageRequestOperationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    });
    
    return _af_sharedImageRequestOperationQueue;
}

@end
