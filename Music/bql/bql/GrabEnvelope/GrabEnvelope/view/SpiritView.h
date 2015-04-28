//
//  SpiritView.h
//  GrabEnvelope
//
//  Created by bai on 15/4/23.
//  Copyright (c) 2015年 bai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLImageView.h"
@interface SpiritView : UIView


+ (SpiritView *)loadXib;

@property (weak, nonatomic) IBOutlet UIImageView *hbImage;
@property (weak, nonatomic) IBOutlet YLImageView *leftImage;
@property (weak, nonatomic) IBOutlet YLImageView *rightImage;


- (void) changeImage;

@end
