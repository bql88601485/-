//
//  AppDelegate+AppInfo.h
//  UIMaster
//
//  Created by bai on 16/6/20.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate (AppInfo)

- (BOOL)UIMasterApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)UIMasterApplicationWillResignActive:(UIApplication *)application ;

- (void)UIMasterApplicationDidEnterBackground:(UIApplication *)application ;

- (void)UIMasterApplicationWillEnterForeground:(UIApplication *)application ;

- (void)UIMasterApplicationDidBecomeActive:(UIApplication *)application;

- (void)UIMasterApplicationWillTerminate:(UIApplication *)application ;

- (BOOL)UIMasterApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (BOOL)UIMasterApplication:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (void)UIMasterApplicationHandleHomeScreenQuickActions:(UIApplicationShortcutItem*)item;

- (void)UIMasterApplicationhandlePushMessage:(NSDictionary *)userInfo;


- (void)UIMasterApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

@end
