//
//  ViewController.m
//  Example
//
//  Created by lzn on 15/8/25.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "ViewController.h"
#import "TopImvTableView.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    TopImvTableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[TopImvTableView alloc] init];
    _tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    //两步:第1步
    [_tableView addTopExpandImvWith:[UIImage imageNamed:@"tower.jpg"] imvHeight:200];
}

//两步:第2步
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_tableView scrollViewDidScroll:scrollView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d",(int)indexPath.row];
    return cell;
}

@end
