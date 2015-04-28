//
//  UINavigationBar+PCChangeBarColor.m
//  WaterCube
//
//  Created by bai on 15-1-27.
//  Copyright (c) 2015年 kevinzhow. All rights reserved.
//

#import "UINavigationBar+PCChangeBarColor.h"

@implementation UINavigationBar (PCChangeBarColor)

-(void)changeBarColor
{
    self.barTintColor = kRGB(42, 104, 175, 1.0);
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];
}

@end
