//
//  StroragePrt.h
//  UIMaster
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StroragePrt <NSObject>

// 通过module和key来存储对象,数据结构的版本号和数据内容的版本号则会为nil
+ (BOOL)saveDataWithObject:(id)object withModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来存储对象数据、数据结构版本、数据内容版本，如果module和key一致的话则会覆盖
+ (BOOL)saveDataWithObject:(id)object withStructVersion:(NSString *)structVersion withDataVersion:(NSString *)dataVersion withModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来删除存储数据
+ (void)deleteDataWithModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来取数据结构版本
+ (NSString *)structVersionWithModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来取数据内容版本
+ (NSString *)dataVersionWithModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来取对应的数据
// 如果object对象实现了DataStoragePrt协议方法，则会在存储的数据结构和对象的数据结构或数据结构版本或数据版本有差异的时候回调DataStoragePrt协议方法
+ (id)objectWithModule:(NSString *)module withKey:(NSString *)key withMerge:(id<MergeDataStoragePrt>)merge;


@end