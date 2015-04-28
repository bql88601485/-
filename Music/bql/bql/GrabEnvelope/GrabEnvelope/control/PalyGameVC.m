//
//  PalyGameVC.m
//  GrabEnvelope
//
//  Created by bai on 15/4/18.
//  Copyright (c) 2015年 bai. All rights reserved.
//

#import "PalyGameVC.h"
#import "SpiritView.h"
@interface PalyGameVC ()
{
    UIView *gameBG;
    NSTimer *palyTime;
    
    int touchNum;
    
    BOOL gameOver;
    
    
    UIButton *playGo;
    
    
    UIImageView *readyImage;
    UIImageView *goImage;
    UIImageView *pourMeter;
    UIImageView *titleOverImage;
    
    
    UIView *footerView;
    
    int timeSecond;

    
    SpiritView *spirt;
    
    UIImageView *eOverImage;

}
@end

@implementation PalyGameVC
#pragma mark 功能函数
-(void)handleTap
{
    if (gameOver) {
        return;
    }
    touchNum++;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //设置抖动幅度
        shake.fromValue = [NSNumber numberWithFloat:-0.1];
        shake.toValue = [NSNumber numberWithFloat:+0.1];
        shake.duration = 0.05;
        shake.autoreverses = YES; //是否重复
        shake.repeatCount = 4;
        [spirt.layer addAnimation:shake forKey:@"imageView"];
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:nil completion:nil];
    });
}
- (void) timeOver
{
    
    if (touchNum >= 10) {
        NSString *ss = [NSString stringWithFormat:@"我靠牛逼，你抢到了   %d",touchNum];
        
        ToastViewMessage(ss);
    }
    else
    {
        NSString *ss = [NSString stringWithFormat:@"水货，没抢到   %d",touchNum];
        ToastViewMessage(ss);
    }
    gameOver = YES;
    [palyTime invalidate];
    pourMeter.hidden = YES;
    titleOverImage.hidden = NO;
    
    [UIView animateWithDuration:2 animations:^{
        [spirt changeImage];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.35 animations:^{
            titleOverImage.y = 0;
            footerView.alpha = 1;
            eOverImage.frame = footerView.bounds;
        } completion:^(BOOL finished) {
            
        }];
    }];
}
- (void) handleTimer: (NSTimer *) timer
{
    if (gameBG.y >= 0) {
        return;
    }
    gameBG.y += 6.9;
}

-(void)playingGame:(id )sender
{
    UIButton *bt = (UIButton *)sender;
    bt.userInteractionEnabled = NO;
    @weakify(self);
    [UIView animateWithDuration:0.5 animations:^{
        readyImage.x = self_weak_.view.width/2 - readyImage.width/2;
        goImage.x = self_weak_.view.width/2 - goImage.width/2;
    } completion:^(BOOL finished) {
        sleep(0.35);
        [UIView animateWithDuration:0.3 animations:^{
            readyImage.hidden = YES;
            goImage.alpha = 1.0;
        } completion:^(BOOL finished) {
            sleep(0.35);
            [UIView animateWithDuration:0.5 animations:^{
                goImage.x = -self_weak_.view.width;
            } completion:^(BOOL finished) {
                palyTime = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                            target: self_weak_
                                                          selector: @selector(handleTimer:)
                                                          userInfo: nil
                                                           repeats: YES];
                pourMeter.hidden = NO;
                //开始动画
                [pourMeter startAnimating];
                [self_weak_ performSelector:@selector(timeOver) withObject:nil afterDelay:3];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self_weak_ action:@selector(handleTap)];
                [self_weak_.view addGestureRecognizer:tap];
            }];

        }];
    }];
}

#pragma mark 搭建页面
- (void)CreateSpitView
{
    gameBG = [[UIView alloc] init];
    gameBG.frame = CGRectMake(0, -self.view.height*3, self.view.width, self.view.height*4);
    [self.view addSubview:gameBG];
    
    UIImage *imagePalay = [UIImage imageNamed:@"背景.png"];
    UIImageView *imagebg = [[UIImageView alloc] init];
    [imagebg setImage:imagePalay];
    imagebg.frame = CGRectMake(-50, 0, gameBG.width + 100, gameBG.height);
    [gameBG addSubview:imagebg];
    
    
    @weakify(self);
    
    CGFloat selfWith = self.view.width;
    CGFloat xStar = 50;
    CGFloat getWtih = selfWith - (xStar*2);
    
    spirt = [SpiritView loadXib];
    spirt.frame = CGRectMake(xStar, self.view.height - spirt.height-50, getWtih, spirt.height);
    [self.view addSubview:spirt];
    
    readyImage = [[UIImageView alloc] init];
    [readyImage setImage:[UIImage image:@"ready.png"]];
    readyImage.frame = CGRectMake(self.view.width, self.view.height-400, 320, 114);
    [self.view addSubview:readyImage];
    
    goImage = [[UIImageView alloc] init];
    goImage.alpha = 0;
    [goImage setImage:[UIImage image:@"go.png"]];
    goImage.frame = CGRectMake(self.view.width, self.view.height-400, 320, 114);
    [self.view addSubview:goImage];
    
    pourMeter = [[UIImageView alloc] init];
    pourMeter.frame = CGRectMake(self.view.width/2 - 68/2, self.view.height/2 - 220, 68, 75);
    //设置动画帧
    pourMeter.animationImages=[NSArray arrayWithObjects:
                             [UIImage imageNamed:@"3.png"],
                             [UIImage imageNamed:@"2.png"],
                             [UIImage imageNamed:@"1.png"],nil];
    //设置动画总时间
    pourMeter.animationDuration=3.0;
    //设置重复次数，0表示不重复
    pourMeter.animationRepeatCount=1;
    pourMeter.hidden = YES;
    [self.view  addSubview:pourMeter];
    
    titleOverImage = [[UIImageView alloc] init];
    titleOverImage.frame = CGRectMake(0, -200, self.view.width, 200);
    titleOverImage.hidden = YES;
    [titleOverImage setImage:[UIImage image:@"结果标题.png"]];
    [self.view addSubview:titleOverImage];
    
    
    
    UIImageView *yun = [[UIImageView alloc] init];
    [yun setImage:[UIImage imageNamed:@"云.png"]];
    yun.frame = CGRectMake(0, self.view.height - 70, self.view.width, 70);
    [self.view addSubview:yun];
    
    UILabel *tips = [[UILabel alloc] init];
    tips.frame = CGRectMake(50, spirt.origin.y+spirt.height-15, self.view.width-100, 50);
    tips.textAlignment = UITextAlignmentCenter;
    tips.text = @"3秒内连续点击红包10次以上，否则红包会被别人抢走！";
    tips.textColor = [UIColor whiteColor];
    tips.font = [UIFont systemFontOfSize:18];
    tips.numberOfLines = 0;
    [self.view addSubview:tips];
    
    
    
    footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    footerView.alpha = 0;
    footerView.frame = CGRectMake(0, titleOverImage.height - 20, self.view.width, self.view.height - titleOverImage.height);
    [self.view addSubview:footerView];
    
    
    eOverImage = [[UIImageView alloc] init];
    eOverImage.frame = CGRectMake(footerView.width/2, footerView.height/2, 0, 0);
    [eOverImage setImage:[UIImage image:@"结果底板.png"]];
    [footerView addSubview:eOverImage];
    
    
    
    
    [self performSelector:@selector(playingGame:) withObject:nil afterDelay:0.35];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    touchNum = 0;
    timeSecond = 0;
    [self CreateSpitView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
