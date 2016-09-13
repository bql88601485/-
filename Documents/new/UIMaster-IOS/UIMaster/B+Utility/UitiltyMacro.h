//
//  UitiltyMacro.h
//  UIMaster
//
//  Created by bai on 16/5/19.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

//判断字符串是否为空或者为空字符串
#define StringIsNullOrEmpty(str) (str==nil || [(str) isEqual:[NSNull null]] ||[str isEqualToString:@""])
//判断字符串不为空并且不为空字符串
#define StringNotNullAndEmpty(str) (str!=nil && ![(str) isEqual:[NSNull null]] &&![str isEqualToString:@""])

//判断系统版本的宏定义
#define RTAXI_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define RTAXI_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define RTAXI_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define RTAXI_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define RTAXI_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define kVersionVMargin  (([UIDevice currentDevice].systemVersion.floatValue) < (7.0) ? ([[UIApplication sharedApplication] statusBarFrame].size.height) : (0))

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)


// 的资源获取的宏
#define Source(x)                    [NSBundle pathWihResource:(x) inModule:@"UIMasterBundle"]
#define UIMaster_Image(x)                     [UIImage imageWithBundlePath:(Source((x) != nil ? (x) : @""))]


#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]



#define KEY_PUSH_SWITCH_STATUS                  @"KEY_PUSH_SWITCH_STATUS"




