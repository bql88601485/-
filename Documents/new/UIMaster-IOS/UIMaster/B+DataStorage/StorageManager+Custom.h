//
//  StorageManager+Custom.h
//  UIMaster
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "StorageManager.h"
#import "StroragePrt.h"


////////////////////////////////////////////////////////////
// 自定义存储的分类接口，所有自定义的数据存储都需要实现StroragePrt协议，
// 并把自定义存储的对象传给接口
////////////////////////////////////////////////////////////
@interface StorageManager (Custom)

// 通过module和key来存储对象,数据结构的版本号和数据内容的版本号则会为nil
+ (BOOL)saveDataWithObject:(id<NSObject>)object
                withModule:(NSString *)module
                   withKey:(NSString *)key
               withStorage:(id<StroragePrt>)storage;


// 通过module和key来删除存储数据
+ (void)deleteDataWithModule:(NSString *)module withKey:(NSString *)key withStorage:(id<StroragePrt>)storage;


// 通过module和key来取对应的数据
// 如果object对象实现了DataStoragePrt协议方法，则会在存储的数据结构和对象的数据结构或数据结构版本或数据版本有差异的时候回调DataStoragePrt协议方法
// 差异的情况是指：1、对象的属性名的类型发生变化(包括属性名的类型发生变化或属性名的对应的类不存在)；2、数据对应的数据类不存在
// 注意：NSString和NSMutableString、NSData和NSMutableData、NSArray和NSMutableArray、NSDictionary和NSMutableDictionary的变化也会忽略
+ (id)objectWithModule:(NSString *)module
               withKey:(NSString *)key
           withStorage:(id<StroragePrt>)storage
             withMerge:(id<MergeDataStoragePrt>)merge;

@end
