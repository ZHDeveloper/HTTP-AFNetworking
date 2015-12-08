//
//  ZHHttpManager+Cache.h
//  test
//
//  Created by AdminZhiHua on 15/12/8.
//  Copyright © 2015年 AdminZhiHua. All rights reserved.
//

#import "ZHHttpManager.h"

@interface ZHHttpManager (Cache)

/*!
 *  @author zhihua, 15-12-08 10:12:46
 *
 *  先判读当前网络，如果没有网络先从数据库中获取GET请求
 *  如果当前有网络，则直接网络请求
 *
 *  @param url     请求的URL
 *  @param formCache 是否从缓存中获取
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)BGETFromCache:(NSString * _Nonnull)url parameters:params isFromCache:(BOOL)formCache success:(ResponseSuccess _Nullable)success failure:(ResponseFailure _Nullable)failure;

/*!
 *  @author zhihua, 15-12-08 11:12:54
 *
 *  先判读当前网络，如果没有网络先从数据库中获取POST请求
 *  如果当前有网络，则直接网络请求
 *
 *  @param url     请求的URL
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)BPOSTFromCache:(NSString * _Nonnull)url parameters:params isFromCache:(BOOL)formCache success:(ResponseSuccess _Nullable)success failure:(ResponseFailure _Nullable)failure;


@end
