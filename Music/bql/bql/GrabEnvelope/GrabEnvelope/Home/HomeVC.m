//
//  HomeVC.m
//  GrabEnvelope
//
//  Created by bai on 15/4/18.
//  Copyright (c) 2015年 bai. All rights reserved.
//

#import "HomeVC.h"
#import "PalyGameVC.h"
#import "AppDelegate.h"
@interface HomeVC ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property (weak, nonatomic) IBOutlet UIImageView *tipLable;
@property (weak, nonatomic) IBOutlet UIView *bgListView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgViewConstY;



@property (strong, nonatomic) UILabel *tipStr;

@property (strong, nonatomic) UIScrollView *bgScrollView;

//存钱罐
@property (strong, nonatomic) UIView *saveView;
//排行榜
@property (strong, nonatomic) UIView *rankingView;
//玩法介绍
@property (strong, nonatomic) UIWebView *playGZView;
//兑换
@property (strong, nonatomic) UIView *shoppingView;

@property (strong, nonatomic) UIButton *envelopeButton;
@end

@implementation HomeVC

#pragma mark createView
//全局红包按钮
- (void)createEnvelope
{
    _envelopeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _envelopeButton.frame = CGRectMake(self.view.width - 55, self.view.height - 5, 50, 68);
    [_envelopeButton setBackgroundImage:[UIImage imageNamed:@"捡红包常驻按钮.png"] forState:UIControlStateNormal];
    [_envelopeButton setBackgroundImage:[UIImage imageNamed:@"捡红包常驻按钮down.png"] forState:UIControlStateHighlighted];
    @weakify(self);
    _envelopeButton.rac_command = [[RACCommand   alloc] initWithSignalBlock:^RACSignal *(id input) {
       [input setHidden:YES];
        [self_weak_.bgListView setHidden:YES];
        self_weak_.bgViewConstY.constant = 0;
        
       return [RACSignal empty];
    }];
    [_envelopeButton setHidden:YES];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:_envelopeButton];
}


- (void)createSaveView
{
    
}

//异步构建其他View
- (void)CreateSrcollviewItem
{

    [_envelopeButton setHidden:NO];
    
    _bgScrollView = [[UIScrollView alloc] initWithFrame:_bgListView.bounds];
    _bgScrollView.backgroundColor    = [UIColor clearColor];
    _bgScrollView.pagingEnabled = YES;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    [_bgListView addSubview:_bgScrollView];
    
    //存钱罐
    _saveView = [[UIView alloc] init];
    _saveView.frame = CGRectMake(0, 0, self.view.width, _bgListView.height);
    _saveView.backgroundColor = [UIColor yellowColor];
    [_bgScrollView addSubview:_saveView];
    
    
    //排行榜
    _rankingView = [[UIView alloc] init];
    _rankingView.frame = CGRectMake(self.view.width, 0, self.view.width, _bgListView.height);
    _rankingView.backgroundColor = [UIColor redColor];
    [_bgScrollView addSubview:_rankingView];
    
    
    //玩法介绍
    _playGZView = [[UIWebView alloc] init];
    _playGZView.frame = CGRectMake(self.view.width*2, 0, self.view.width, _bgListView.height);
    _playGZView.backgroundColor = [UIColor blueColor];
    [_bgScrollView addSubview:_playGZView];
    
    
    //排行榜
    _shoppingView = [[UIView alloc] init];
    _shoppingView.frame = CGRectMake(self.view.width*3, 0, self.view.width, _bgListView.height);
    _shoppingView.backgroundColor = [UIColor orangeColor];
    [_bgScrollView addSubview:_shoppingView];
    
    _bgScrollView.contentSize = CGSizeMake(self.view.width*4, 0);
    
    [self createSaveView];
}
- (void)createMenuItem
{
    _IconImage.layer.cornerRadius = _IconImage.size.width/2;
    [_IconImage.layer setMasksToBounds:YES];
    [_IconImage setImage:[UIImage image:@"用户头像.png"]];
    _lineLabel.backgroundColor = [UIColor colorFromHex:0xca3215];
    _lineLabel.height = 0.5;
    
    
    _tipStr = [[UILabel alloc] init];
    _tipStr.frame = _tipLable.bounds;
    _tipStr.textAlignment = UITextAlignmentCenter;
    _tipStr.text = @"12";
    _tipStr.font = [UIFont systemFontOfSize:8];
    _tipStr.backgroundColor = [UIColor clearColor];
    _tipStr.textColor = [UIColor whiteColor];
    [_tipLable addSubview:_tipStr];
    
    
    float starX = 0;
    float starY = 80;
    
    float buttonWith = self.view.width/4;
    
    NSArray *titleArray = @[@"存钱罐",@"排行榜",@"玩法介绍",@"兑换商城"];
    
    for (int i=0; i<[titleArray count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.backgroundColor = [UIColor clearColor];
        [button setBackgroundImage:[UIImage imageNamed:@"捡红包-tabbutton.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"捡红包-tabbutton-down.png"] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"捡红包-tabbutton-down.png"] forState:UIControlStateDisabled];
        [button setBackgroundImage:[UIImage imageNamed:@"捡红包-tabbutton-down.png"] forState:UIControlStateSelected];
        @weakify(self);
        button.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            [UIView animateWithDuration:0.2 animations:^{
                [self_weak_.bgListView setHidden:NO];
                self_weak_.bgViewConstY.constant = -80;
            } completion:^(BOOL finished) {
                [self_weak_ CreateSrcollviewItem];
            }];
            
            
            return [RACSignal empty];
        }];
        button.frame = CGRectMake(starX + (buttonWith)*i, starY, buttonWith, 42);
        [_bgView addSubview:button];
        
        if (i == ([titleArray count] -1)) {
            
        }
        else
        {
            UILabel *line = [[UILabel alloc] init];
            line.backgroundColor = [UIColor colorFromHex:0xca3215];
            line.alpha = 0.8;
            line.frame = CGRectMake(button.origin.x + button.width - 0.5, button.origin.y + 9, 1, 22);
            [_bgView addSubview:line];
        }
    }
    
    _bgView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _bgView.layer.shadowPath = [[UIBezierPath
                                 bezierPathWithRect:_bgView.bounds] CGPath];
    
    [self createEnvelope];
                                
}


#pragma mark action
- (IBAction)playGame:(id)sender {
    [self modalVC:@"PalyGameVC" withNavigationVC:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self performSelector:@selector(createMenuItem) withObject:nil afterDelay:0.1];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"捡红包";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
