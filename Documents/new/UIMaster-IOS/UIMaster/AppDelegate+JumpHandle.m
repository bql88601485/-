//
//  AppDelegate+JumpHandle.m
//  UIMaster
//
//  Created by bai on 16/6/20.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "AppDelegate+JumpHandle.h"

@implementation AppDelegate (JumpHandle)

- (BOOL)jumpHandleOpenURL:(NSURL *)url
              withUrlData:(NSDictionary *)urlData
                 userInfo:(id)userInfo{
    
    if (url == nil) {
        return NO;
    }
    
#ifdef BETA_BUILD
    
    NSLog(@"###########################################");
    NSLog(@"jumpURL : %@", url);
    NSLog(@"jumpDta: %@", urlData);
    NSLog(@"###########################################");
    
#endif
    
    
    if (!urlData) {
        urlData = [[url query] dictionaryFromQueryComponents];
    }
    
    [self JumpUIMaster:url withUrlData:urlData];
    
    return YES;
}

- (void)JumpUIMaster:(NSURL *)url withUrlData:(NSDictionary *)WithDelegate{
    
    NSString *searchType = [url host];
    
}
@end
