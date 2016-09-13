//
//  AppDelegate+AppInfo.m
//  UIMaster
//
//  Created by bai on 16/6/20.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "AppDelegate+AppInfo.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import "WXApi.h"
#import "WeiboSDK.h"


#import "AppDelegate+JumpHandle.h"

#import "JPEngine.h"
#import "HcdGuideViewManager.h"


#define KEY_Q_MAP_API_KEY           @"ZT7BZ-WVLHU-HDTVH-B277W-BIYNE-ISBHR"
#define KEY_PUSH_APP_KEY            @"Xs04ra3BHZBHlGAGvy11bv7t"


@implementation AppDelegate (AppInfo)

#pragma mark - baiPush
- (void)baiPush:(NSDictionary *)launchOptions{
    
    // iOS8 下需要使用新的 API
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationType myTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }else {
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
    }
    
    //角标清0
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

#pragma mark - JS 引擎
- (void)startJSPatch{
    
    //需要做一个 加载js 功能 后期做
    
    //从服务器获取更新JS
    //    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"xxx"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    //        NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //        [JPEngine evaluateScript:script];
    //    }];
    
    //开始初始化引擎
    [JPEngine startEngine];
    //读取js文件
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"baiqilong" ofType:@"js"];
    //运行js文件
    [JPEngine evaluateScriptWithPath:sourcePath];
    
}

#pragma mark - home
- (void)shareInitHome{
    
    UIViewController *rootView = [[UIViewController alloc] init];
    self.window.rootViewController = rootView;
}

#pragma mark - QMap
- (void)initQMap{
    
}

#pragma mark - XFYUN
- (void)intiXFYun{
    
    
    
}

//Reachability
- (void)CheckNetStatus{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    /*!
     *  @return -1。0(无) 1 3G 2 wifi
     */
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:AFNetworkingReachabilityDidChangeNotification object:nil] subscribeNext:^(NSNotification *x) {
        NSInteger status = [[x.userInfo objectForKey:AFNetworkingReachabilityNotificationStatusItem] integerValue];
        netStatus = status;
    }];
}

//show guide
- (void)showHcdGuide{
    
    //    NSMutableArray *images = [NSMutableArray new];
    //    
    //    [images addObject:UIMaster_Image(@"1.png")];
    //    [images addObject:UIMaster_Image(@"2.png")];
    //    [images addObject:UIMaster_Image(@"3.png")];
    //    [[HcdGuideViewManager sharedInstance] showGuideViewWithImages:images
    //                                                   andButtonTitle:@"立即体验"
    //                                              andButtonTitleColor:[UIColor whiteColor]
    //                                                 andButtonBGColor:[UIColor clearColor]
    //                                             andButtonBorderColor:[UIColor whiteColor]];
}
- (void)initSharePlatform
{
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     */
    [ShareSDK registerApp:ShareSDK_APP_ID
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeMail),
                            @(SSDKPlatformTypeSMS),
                            @(SSDKPlatformTypeCopy),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:SINA_APP_KEY
                                           appSecret:SINA_APP_SECRET
                                         redirectUri:SINA_REDIRECTURI
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:WX_APP_ID
                                       appSecret:WX_APP_KEY];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:QQ_SPACE_APP_ID
                                      appKey:QQ_SPACE_APP_KEY
                                    authType:SSDKAuthTypeBoth];
                 break;
             default:
                 break;
         }
     }];
}


-(void)onResp:(BaseResp *)resp
{
    NSLog(@"The response of wechat.");
}

- (BOOL)UIMasterApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [self baiPush:launchOptions];
    
    [self initQMap];
    
    [self CheckNetStatus];
    
    [self intiXFYun];
    
    [self initSharePlatform];
    
    [self startJSPatch];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // =====================================================================
    // 创建Window，设置VCManager
    // =====================================================================
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [window setBackgroundColor:[UIColor clearColor]];
    
    // 设置到AppDelegate
    [self setWindow:window];
    
    [window makeKeyAndVisible];
    
    [self shareInitHome];
    
    [self showHcdGuide];
    
    return YES;
}

- (void)UIMasterApplicationWillResignActive:(UIApplication *)application{
    
}

- (void)UIMasterApplicationDidEnterBackground:(UIApplication *)application{
    
}

- (void)UIMasterApplicationWillEnterForeground:(UIApplication *)application{
    
}

- (void)UIMasterApplicationDidBecomeActive:(UIApplication *)application{
    
}

- (void)UIMasterApplicationWillTerminate:(UIApplication *)application{
    
    
}
- (BOOL)UIMasterApplication:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [self jumpHandleOpenURL:url withUrlData:nil userInfo:nil];
}
- (BOOL)UIMasterApplication:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [self jumpHandleOpenURL:url withUrlData:nil userInfo:nil];
}

- (void)UIMasterApplicationHandleHomeScreenQuickActions:(UIApplicationShortcutItem*)item{
    
    
}

- (void)UIMasterApplicationhandlePushMessage:(NSDictionary *)userInfo{
    
    
    NSLog(@"********** ios7.0之前 **********");
    // 应用在前台 或者后台开启状态下，不跳转页面，让用户选择。
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive || [UIApplication sharedApplication].applicationState == UIApplicationStateBackground) {
        NSLog(@"acitve or background");
        UIAlertView *alertView =[[UIAlertView alloc]initWithTitle:@"收到一条消息" message:userInfo[@"aps"][@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    else//杀死状态下，直接跳转到跳转页面。
    {
        [self jumpHandleOpenURL:nil withUrlData:userInfo userInfo:nil];
    }
}
- (void)UIMasterApplication:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    
    [[NSUserDefaults standardUserDefaults] setObject:@1 forKey:KEY_PUSH_SWITCH_STATUS];
    
    NSLog(@"test:%@",deviceToken);
}

@end
