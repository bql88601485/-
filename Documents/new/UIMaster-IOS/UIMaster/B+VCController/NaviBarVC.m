//
//  NaviBarVC.m
//  UIMaster
//
//  Created by bai on 16/5/16.
//  Copyright © 2016年 com.UIMaster.com. All rights reserved.
//

#import "NaviBarVC.h"
#import "NaviBarItem.h"
#import "VCController.h"
#import "VCAnimationClassic.h"

// ==================================================================
// 布局参数
// ==================================================================
#define kNaviNameNaivBarHeight				64

@interface NaviBarVC ()

@property (nonatomic, retain) NaviBar *naviBarHead;     // 导航栏

@end

@implementation NaviBarVC

// 初始化函数
- (instancetype)init
{
    if((self = [super init]) != nil)
    {
        // 创建NaviBar
        _naviBarHead = [[NaviBar alloc] initWithFrame:CGRectZero];
        
        return self;
    }
    
    return nil;
}

- (instancetype)initWithName:(NSString *)vcNameInit
{
    if((self = [super initWithName:vcNameInit]) != nil)
    {
        // 创建NaviBar
        _naviBarHead = [[NaviBar alloc] initWithFrame:CGRectZero];
        
        return self;
    }
    
    return nil;
}

// 重载初始化函数
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建NaviBar
    CGRect vcViewFrame = [[self view] frame];
    [_naviBarHead setFrame:CGRectMake(0, 0, vcViewFrame.size.width, kNaviNameNaivBarHeight)];
    
    // 创建NaviBar的子界面
    [self setupNaviBarDefaultSubs:_naviBarHead];
    
    // 添加
    [[self view] addSubview:_naviBarHead];
}

// 设置StatusBar样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// 创建NavigationBar的子界面
- (void)setupNaviBarDefaultSubs:(NaviBar *)viewParent
{
    // BackItem
    NaviBarItem *leftItem = [[NaviBarItem alloc] initBackItem:self action:@selector(goBack:)];
    [viewParent setLeftBarItem:leftItem];
}

// 获取Bar
- (NaviBar *)naviBar
{
    return _naviBarHead;
}

// 返回事件
- (void)goBack:(id)sender
{
    [VCController popWithAnimation:[VCAnimationClassic defaultAnimation]];
}

// =======================================================================
// 默认的EmptyView的位置和尺寸
// =======================================================================
- (void)justifyEmptyView:(LoadEmptyView *)loadEmptyView inView:(UIView *)viewParent
{
    NSInteger naviBarHeight = [_naviBarHead frame].size.height;
    [loadEmptyView setFrame:CGRectMake(0, naviBarHeight, [[self view] frame].size.width,
                                       [[self view] frame].size.height - naviBarHeight)];
}

@end
