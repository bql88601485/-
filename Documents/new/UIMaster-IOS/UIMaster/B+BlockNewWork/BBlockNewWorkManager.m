//
//  BBlockNewWorkManager.m
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "BBlockNewWorkManager.h"
#import "HTDataCache.h"
@interface BBlockNewWorkManager ()<HTRequestDelegate>

@property (nonatomic, strong) NSMutableDictionary *dicForBlock;           // 保存block信息
@property (nonatomic, strong) NSMutableDictionary *dicForConnect;         // 保存请求信息

@property (nonatomic, strong) HTRequestConfig *config;

@end

@implementation BBlockNewWorkManager

- (id)init
{
    self = [super init];
    if (self) {
        self.dicForBlock = [NSMutableDictionary dictionary];
        self.dicForConnect = [NSMutableDictionary dictionary];
        
        
        _config=[[HTRequestConfig alloc] init];
        
    }
    return self;
}

+ (instancetype)defaultManager{
    
    static BBlockNewWorkManager *staticSelf = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticSelf = [[BBlockNewWorkManager alloc] init];
    });
    
    return staticSelf;
}

#pragma mark - 发起请求

- (HTRequest *)startRequest:(NSString *)urlPath withParam:(NSMutableDictionary *)param respondData:(Class )searchNetResult resultBlock:(BNetWorkBlock)block methodType:(RequestMethod)methodType{
    
    HTNetWorkClient *client=[[HTNetWorkClient alloc] init];
    client.delegate = self;
    
    __weak NSString *weakUrlPath = urlPath;
    
    @weakify(self);
    HTRequest *request =[HTRequest sharedRequestWithMethodType:methodType withPath:urlPath withParam:param withConfig:_config respondData:searchNetResult];
    
    [client startAsynchronous:request onProgress:^(NSProgress *progress, NSString *tag) {
        
    } onResponse:^(HTResponse *response) {
        
        @strongify(self);
        BNetWorkBlock block = nil;
        if ( ( block = [self.dicForBlock objectForKey:weakUrlPath] )) {
            block(BRequestStatus_success,response.object,@0);
        }
        
        [self clearObjectUrl:weakUrlPath];
        
    } onError:^(HTNetWorkError *responseError) {
        
        @strongify(self);
        BNetWorkBlock block = nil;
        if ( ( block = [self.dicForBlock objectForKey:weakUrlPath] )) {
            block(BRequestStatus_fail,responseError,[NSNumber numberWithInt:-1]);
        }
        
        [self clearObjectUrl:weakUrlPath];
    }];
    
    [self.dicForBlock setObject:block forKey:urlPath];
    [self.dicForConnect setObject:client forKey:urlPath];
    
    return request;
}

- (void)cancleAllRequests{
    
    [[[AFHTTPSessionManager manager] operationQueue] cancelAllOperations];
}

-(HTRequest *)searchRequest:(NSString *)urlPath{
    
    return [[HTDataCache sharedManager]getCacheDataWithUrl:urlPath];
}

- (void)clearObjectUrl:(NSString *)urlPath{
    
    if (urlPath) {
        [self.dicForBlock removeObjectForKey:urlPath];
        [self.dicForConnect removeObjectForKey:urlPath];
    }
    
    
}

- (id )GetRequestCache:(NSString *)urlPath withParam:(NSMutableDictionary *)param{
    
    NSString *newUrl = urlPath;
    newUrl = [NSString stringWithFormat:@"%@?",newUrl];
    for (NSString *key in [param allKeys]) {
        
        NSString *value = [param objectForKey:key];
        
        newUrl = [NSString stringWithFormat:@"%@%@=%@&",newUrl,key,value];
        
    }
    
    if (![NSURL URLWithString:newUrl]) {
        newUrl = [newUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    id objct = [StorageManager objectWithModule:@"xxx" withKey:[_config.baseUrl stringByAppendingString:newUrl] withMerge:nil];
    
    return objct;
}

@end
