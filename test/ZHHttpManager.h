//
//  ZHHttpTool.h
//  test
//
//  Created by AdminZhiHua on 15/12/8.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

///减少对第三方的依赖
typedef AFHTTPRequestOperation ZHRequestOperation;

///定义成功的回调
typedef void (^ResponseSuccess)(ZHRequestOperation * _Nullable operation, id  _Nullable responseObject);

///定义失败的回调
typedef void (^ResponseFailure)(ZHRequestOperation * _Nullable operation, NSError * _Nonnull error);

@interface ZHHttpManager : NSObject

/*!
 *  @author zhihua, 15-12-08 10:12:46
 *
 *  GET请求
 *
 *  @param url     请求的URL
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)BGET:(NSString * _Nonnull)url parameters:params success:(ResponseSuccess _Nullable)success failure:(ResponseFailure _Nullable)failure;

/*!
 *  @author zhihua, 15-12-08 11:12:54
 *
 *  POST请求
 *
 *  @param url     请求的URL
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)BPOST:(NSString * _Nonnull)url parameters:params success:(ResponseSuccess _Nullable)success failure:(ResponseFailure _Nullable)failure;


/*!
 *  @author zhihua, 15-12-08 15:12:41
 *
 *  文件在子线程下载，需要在主线程更新UI
 *
 *  @param path          下载的路劲
 *  @param savePath      文件下载完成的保存路劲
 *  @param progressBlock 下载进入Block
 *  @param completeBlock 下载完成Block
 */
- (void)fileDownload:(NSString * _Nonnull)path savePath:(NSString * _Nonnull)savePath progress:(void (^ _Nullable)(int64_t totalBytesWritten,int64_t totalBytesExpectedToWrite))progressBlock complete:(void (^ _Nullable)(NSString * _Nullable filePath,NSError * _Nullable error))completeBlock;


/*!
 *  @author zhihua, 15-12-08 16:12:15
 *
 *  获取当前的网络状态，只获取一次
 *
 *  @param block 获取成功的回调
 */
+ (void)currentReachability:(void (^ _Nullable)(AFNetworkReachabilityStatus status))block;

/*!
 *  @author zhihua, 15-12-08 16:12:40
 *
 *  实时监控网络状态的变化
 *  当网络状态发生改变的时候，会发送通知@"kReachabilityStatusChange"
 *  通知中带有object参数
 *  AFNetworkReachabilityStatusUnknown          = -1,
 *  AFNetworkReachabilityStatusNotReachable     = 0,
 *  AFNetworkReachabilityStatusReachableViaWWAN = 1,
 *  AFNetworkReachabilityStatusReachableViaWiFi = 2,
 */
- (void)startMonitorReachability;

/*!
 *  @author zhihua, 15-12-08 16:12:40
 *
 *  停止网络状态的监控
 */
- (void)stopMonitorReachability;

@end
