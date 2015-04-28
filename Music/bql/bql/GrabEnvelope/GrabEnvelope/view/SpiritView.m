//
//  SpiritView.m
//  GrabEnvelope
//
//  Created by bai on 15/4/23.
//  Copyright (c) 2015年 bai. All rights reserved.
//

#import "SpiritView.h"
#import "YLGIFImage.h"
@implementation SpiritView

+ (SpiritView *)loadXib
{
    NSString *className = NSStringFromClass([self class]);
    NSArray *xibArray = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil];
    return [xibArray safeObjectAtIndex:0];
}

- (void)drawRect:(CGRect)rect
{
    [self CreateView];
}
- (void)CreateView
{
    _leftImage.image = [YLGIFImage imageNamed:@"动画.gif"];
    _rightImage.image = [YLGIFImage imageNamed:@"动画.gif"];
}

- (void) changeImage
{
    [_hbImage setImage:[UIImage imageNamed:@"红包02.png"]];
}
@end
