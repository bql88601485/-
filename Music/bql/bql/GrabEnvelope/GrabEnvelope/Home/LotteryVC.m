//
//  LotteryVC.m
//  GrabEnvelope
//
//  Created by bai on 15-4-22.
//  Copyright (c) 2015年 bai. All rights reserved.
//

#import "LotteryVC.h"
#import "lotteryCell.h"

static NSString *cellStr = @"lotteryCell";

@interface LotteryVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation LotteryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"中大奖";
    
    UINib *nib = [UINib nibWithNibName:@"lotteryCell" bundle:nil];
    [_tableview registerNib:nib forCellReuseIdentifier:cellStr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    lotteryCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    cell.bgView.layer.cornerRadius = 4.0;
    [cell.bgView.layer setMasksToBounds:YES];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
@end
