//
//  ZHHttpTool.m
//  test
//
//  Created by AdminZhiHua on 15/12/8.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "ZHHttpManager.h"

@interface ZHHttpManager ()

///销毁时移除观察者
@property (nonatomic,strong) NSProgress *progress;

@property (nonatomic,strong) void (^progressBlock)(int64_t totalBytesWritten,int64_t totalBytesExpectedToWrite);

@property (nonatomic,strong) void (^completeBlock)(NSString *filePath,NSError *error);

@property (nonatomic,strong) AFNetworkReachabilityManager *reachabilityManager;

@end

@implementation ZHHttpManager

+ (void)BGET:(NSString *)url parameters:params success:(ResponseSuccess)success failure:(ResponseFailure)failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if (success) success(operation,responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        if (failure) failure(operation,error);
        
    }];

}

+ (void)BPOST:(NSString *)url parameters:(id)params success:(ResponseSuccess)success failure:(ResponseFailure)failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        if (success) success(operation,responseObject);

    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
        if (failure) failure(operation,error);

    }];
    
}

- (void)fileDownload:(NSString *)path savePath:(NSString *)savePath progress:(void (^)(int64_t totalBytesWritten,int64_t totalBytesExpectedToWrite))progressBlock complete:(void (^)(NSString *filePath,NSError *error))completeBlock{
    
    self.progressBlock = progressBlock;
    self.completeBlock = completeBlock;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSProgress *progress = nil;
    self.progress = progress;

    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        NSString *fileName = response.suggestedFilename;
        
        NSString *fullPath = [savePath stringByAppendingPathComponent:fileName];
        
        NSURL *filePath = [NSURL fileURLWithPath:fullPath];
        
        return filePath;
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (self.completeBlock) self.completeBlock(filePath.absoluteString,error);
    }];
    
    //使用kvo
    [progress addObserver:self forKeyPath:@"completedUnitCount" options:NSKeyValueObservingOptionNew context:NULL];
    
    //开启任务
    [task resume];
    
}

//获取并计算当前文件的下载进度
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(NSProgress *)progress change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if (self.progressBlock) self.progressBlock(progress.completedUnitCount,progress.totalUnitCount);
    
}

+ (void)currentReachability:(void (^)(AFNetworkReachabilityStatus status))block {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (block) block(status);
        
    }];
    
    [manager stopMonitoring];
    
}

- (void)startMonitorReachability {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    self.reachabilityManager = manager;
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
        
        [notiCenter postNotificationName:@"kReachabilityStatusChange" object:@(status)];
        
    }];
    
    [manager startMonitoring];
    
}

- (void)stopMonitorReachability {
    
    [self.reachabilityManager stopMonitoring];
    
    self.reachabilityManager = nil;
}


- (void)dealloc {
    [self.progress removeObserver:self forKeyPath:@"completedUnitCount"];
    self.progress = nil;
    NSLog(@"manager dealloc");
}

@end
