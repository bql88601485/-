//
//  JumpHandle.m
//  UIMaster
//
//  Created by bai on 16/8/22.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "JumpHandle.h"

@implementation JumpHandle

+ (BOOL)JumpHandleOpenURL:(NSString *)schemeStr{
    
    if (StringIsNullOrEmpty(schemeStr)) {
        return NO;
    }
    NSURL *url = [NSURL URLWithString:[schemeStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
    
    return YES;
}

@end
