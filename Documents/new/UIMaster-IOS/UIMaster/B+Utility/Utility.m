//
//  Utility.m
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "Utility.h"

#define KEY_SAVE_CATES_INDEX                @"KEY_SAVE_CATES_INDEX"
#define KEY_Module_CATES_INDEX              @"KEY_Module_CATES_INDEX"

@implementation Utility



+ (UIColor *) colorWithHexString:(NSString *)hexColor
{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }else if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


+ (void)saveCates_index:(NSObject *)data{
    
    [StorageManager saveDataWithObject:data withModule:KEY_Module_CATES_INDEX withKey:KEY_SAVE_CATES_INDEX];
}

+ (id )getCates_index{
    return [StorageManager objectWithModule:KEY_Module_CATES_INDEX withKey:KEY_SAVE_CATES_INDEX withMerge:nil];
}


+(double) LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2{
    
    CLLocation *orig=[[CLLocation alloc] initWithLatitude:lat1 longitude:lon1];
    
    CLLocation* dist=[[CLLocation alloc] initWithLatitude:lat2 longitude:lon2];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist]/1000;
    NSLog(@"距离: %f",kilometers);
    
    return kilometers;
}


+ (float)getRandomNumber{
    
    return (1000000000000000 + (arc4random() % (9999999999999999)));
}

@end
