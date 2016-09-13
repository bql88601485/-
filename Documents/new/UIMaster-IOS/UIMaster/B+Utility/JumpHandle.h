//
//  JumpHandle.h
//  UIMaster
//
//  Created by bai on 16/8/22.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JumpHandle : NSObject

/**
 *  通过URL来调用界面
 *
 *  @param url 跳转到的URL，通常为 UIMaster://storeorder/xxx 的形式
 *
 *  @return 返回是否有模块接受该URL并进行处理，处理URL可能是异步的，不能保证线程安全
 */
+ (BOOL)JumpHandleOpenURL:(NSString *)schemeStr;

@end
