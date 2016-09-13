//
//  StorageManager+Custom.m
//  UIMaster
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "StorageManager+Custom.h"
#import <objc/runtime.h>

@implementation StorageManager (Custom)

// 通过module和key来存储对象,数据结构的版本号和数据内容的版本号则会为nil
+ (BOOL)saveDataWithObject:(id<NSObject>)object
                withModule:(NSString *)module
                   withKey:(NSString *)key
               withStorage:(id<StroragePrt>)storage
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(saveDataWithObject:withModule:withKey:)) != nil)
    {
        return [[storage class] saveDataWithObject:object withModule:module withKey:key];
    }
    
    return NO;
}

// 通过module和key来存储对象数据、数据结构版本、数据内容版本，如果module和key一致的话则会覆盖
+ (BOOL)saveDataWithObject:(id<NSObject>)object
         withStructVersion:(NSString *)structVersion
           withDataVersion:(NSString *)dataVersion
                withModule:(NSString *)module
                   withKey:(NSString *)key
               withStorage:(id<StroragePrt>)storage
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(saveDataWithObject:withStructVersion:withDataVersion:withModule:withKey:)) != nil)
    {
        return [[storage class] saveDataWithObject:object withStructVersion:structVersion withDataVersion:dataVersion withModule:structVersion withKey:dataVersion];
    }
    
    return NO;
}

// 通过module和key来删除存储数据
+ (void)deleteDataWithModule:(NSString *)module withKey:(NSString *)key withStorage:(id<StroragePrt>)storage
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(deleteDataWithModule:withKey:)) != nil)
    {
        [[storage class] deleteDataWithModule:module withKey:key];
    }
}

// 通过module和key来取数据结构版本
+ (NSString *)structVersionWithModule:(NSString *)module
                              withKey:(NSString *)key
                          withStorage:(id<StroragePrt>)storage
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(structVersionWithModule:withKey:)) != nil)
    {
        return [[storage class] structVersionWithModule:module withKey:key];
    }
    
    return nil;
}

// 通过module和key来取数据内容版本
+ (NSString *)dataVersionWithModule:(NSString *)module
                            withKey:(NSString *)key
                        withStorage:(id<StroragePrt>)storage
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(dataVersionWithModule:withKey:)) != nil)
    {
        return [[storage class] dataVersionWithModule:module withKey:key];
    }
    
    return nil;
}

// 通过module和key来取对应的数据
// 如果object对象实现了DataStoragePrt协议方法，则会在存储的数据结构和对象的数据结构或数据结构版本或数据版本有差异的时候回调DataStoragePrt协议方法
+ (id)objectWithModule:(NSString *)module
               withKey:(NSString *)key
           withStorage:(id<StroragePrt>)storage
             withMerge:(id<MergeDataStoragePrt>)merge
{
    if ([storage class] != nil &&
        class_conformsToProtocol([storage class], @protocol(StroragePrt)) == YES &&
        class_getClassMethod([storage class], @selector(objectWithModule:withKey:withStorage:withMerge:)) != nil)
    {
        return [[storage class] objectWithModule:module withKey:key withMerge:merge];
    }
    
    return nil;
}

@end
