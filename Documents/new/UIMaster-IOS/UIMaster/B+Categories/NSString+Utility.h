//
//  NSString+Utility.h
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (Utility)

// Encoding
- (NSString *)getSHA1;
- (NSString *)getMD5;

// Valid
- (BOOL)isRangeValidFromIndex:(NSInteger)index withSize:(NSInteger)rangeSize;

// get Random String
- (NSString *)getRandomStringByLength:(NSInteger)len;

// get app group
+ (NSString*)getAppGroupID;

// String2Date
- (NSString *)getYYMMDDFWW;

//用 ****替换部分字符
- (NSString *)getHidenPartString;

// 产生 hash code
+ (NSString *)hashString:(NSString *)data withSalt:(NSString *)salt;

- (BOOL)isStringSafe;

// Trim
- (NSString *)trimSpaceString;

// 适配函数
- (CGSize)sizeWithFontCompatible:(UIFont *)font;
- (CGSize)sizeWithFontCompatible:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)sizeWithFontCompatible:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)sizeWithFontCompatible:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (void)drawAtPointCompatible:(CGPoint)point withFont:(UIFont *)font;
- (void)drawInRectCompatible:(CGRect)rect withFont:(UIFont *)font;
- (void)drawInRectCompatible:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode alignment:(NSTextAlignment)alignment;

// 十六进制转换为普通字符串的。
- (NSString *)stringFromHexString:(NSString *)hexString;

//普通字符串转换为十六进制的
- (NSString *)hexStringFromString:(NSString *)string;

@end
