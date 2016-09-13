//
//  VCAnimationBottom.h
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCAnimation.h"

@interface VCAnimationBottom : NSObject <VCAnimation>

/**
 *  底部弹出动画默认创建实例
 *
 *  @return 返回默认配置实例
 */
+ (VCAnimationBottom *)defaultAnimation;

@end
