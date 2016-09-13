//
//  StorageVersionPrt.h
//  UIMaster
//
//  Created by bai on 16/5/18.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol StrorageVersionPrt <StroragePrt>

// 通过module和key来存储对象数据、数据结构版本、数据内容版本，如果module和key一致的话则会覆盖
+ (BOOL)saveDataWithObject:(id)object withStructVersion:(NSString *)structVersion withDataVersion:(NSString *)dataVersion withModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来取数据结构版本
+ (NSString *)structVersionWithModule:(NSString *)module withKey:(NSString *)key;

// 通过module和key来取数据内容版本
+ (NSString *)dataVersionWithModule:(NSString *)module withKey:(NSString *)key;

@end
