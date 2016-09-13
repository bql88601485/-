//
//  Utility.h
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Utility : NSObject

+ (UIColor *) colorWithHexString:(NSString *)hexColor;


+ (void)saveCates_index:(NSObject *)data;

+ (id )getCates_index;

+(double) LantitudeLongitudeDist:(double)lon1 other_Lat:(double)lat1 self_Lon:(double)lon2 self_Lat:(double)lat2;

+ (float)getRandomNumber;

@end
