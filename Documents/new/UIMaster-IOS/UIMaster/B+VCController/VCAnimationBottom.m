//
//  VCAnimationBottom.m
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "VCAnimationBottom.h"

@implementation VCAnimationBottom

+ (VCAnimationBottom *)defaultAnimation
{
    return [[VCAnimationBottom alloc] init];
}

- (void)pushAnimationFromTopVC:(UIViewController *)topVC
                    ToArriveVC:(UIViewController *)arriveVC
                WithCompletion:(void (^)(BOOL finished))completion
{
    [[arriveVC view] setViewY:[[arriveVC view] frame].size.height];
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [[arriveVC view] setViewY:0];
                     }
                     completion:completion];
}

- (void)popAnimationFromTopVC:(UIViewController *)topVC
                   ToArriveVC:(UIViewController *)arriveVC
               WithCompletion:(void (^)(BOOL finished))completion
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [[topVC view] setViewY:[[topVC view] frame].size.height];
                     }
                     completion:completion];
}

@end
