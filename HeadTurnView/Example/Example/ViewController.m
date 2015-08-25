//
//  ViewController.m
//  Example
//
//  Created by lzn on 15/8/25.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "ViewController.h"
#import "HeadTurnView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HeadTurnView *viewHead = [HeadTurnView createWithFrame:CGRectMake(100, 100, 200, 200) andImgs:@[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"]]];
    [self.view addSubview:viewHead];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
