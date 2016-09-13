//
//  BBlockNewWorkManager.h
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTNetWorkClient.h"

// 网络请求的状态
typedef NS_ENUM(NSInteger, BRequestStatus) {
    
    BRequestStatus_start,          // 请求开始
    BRequestStatus_loading,        // 加载中
    BRequestStatus_success,        // 请求成功
    BRequestStatus_fail,        // 请求失败：网络失败
    
    BRequestStatus_cache           // 缓存
};

typedef void(^BNetWorkBlock)(BRequestStatus status, id data, NSNumber *returnCode);

@interface BBlockNewWorkManager : NSObject

/*!
 *  产出
 */
+ (instancetype)defaultManager;

/*!
 *  发起一个请求
 *
 *  @param urlPath         api
 *  @param param           参数
 *  @param searchNetResult 数据Model
 *  @param block           请求回调
 *
 *  @return
 */
- (HTRequest *)startRequest:(NSString *)urlPath withParam:(NSMutableDictionary *)param respondData:(Class )searchNetResult resultBlock:(BNetWorkBlock)block methodType:(RequestMethod)methodType;

/*!
 *  取消所有请求
 */
- (void)cancleAllRequests;

/*!
 *  搜索一个请求
 *
 *  @param urlPath
 *
 *  @return 
 */
-(HTRequest *)searchRequest:(NSString *)urlPath;

/*!
 *  获取缓存
 *
 *  @param urlPath
 */
- (id )GetRequestCache:(NSString *)urlPath withParam:(NSMutableDictionary *)param;

@end
