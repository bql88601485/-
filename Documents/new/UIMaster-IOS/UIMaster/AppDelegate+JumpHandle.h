//
//  AppDelegate+JumpHandle.h
//  UIMaster
//
//  Created by bai on 16/6/20.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (JumpHandle)

/*!
 *  Jump
 */
- (BOOL)jumpHandleOpenURL:(NSURL *)url
              withUrlData:(NSDictionary *)urlData
                 userInfo:(id)userInfo;

@end
