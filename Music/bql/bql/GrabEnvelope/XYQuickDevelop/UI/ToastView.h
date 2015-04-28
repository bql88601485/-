//
//  ToastView.h
//  Car
//
//  Created by bai on 15-1-19.
//  Copyright (c) 2015年 Qunar.com. All rights reserved.
//
#import <UIKit/UIKit.h>

#define ToastViewMessage(message) [ToastView showMessage:message]

@interface ToastView : UIView

+ (void)showMessage:(NSString*)msg;

@end
