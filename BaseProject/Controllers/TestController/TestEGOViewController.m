//
//  TestEGOViewController.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/9.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "TestEGOViewController.h"

@interface TestEGOViewController ()<LoadMoreTableViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArray;
}

@end

@implementation TestEGOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArray = [NSMutableArray arrayWithObjects:@"导航栏测试",@"MBProgressHUD测试",@"EGOTableViewPullRefresh测试", nil];
    
    myTableView = [[LoadMoreTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_FULL_SCREEN, HEIGHT_FULL_VIEW) style:UITableViewStylePlain];
    if (IOS7_LATER) {
        myTableView.separatorInset = UIEdgeInsetsZero;
    }
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.loadMoreDelegate = self;
    myTableView.loadMoreArrowImage = nil;
    myTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:myTableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"test";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row < dataArray.count) {
        cell.textLabel.text = [dataArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)loadMoreTableViewDidTriggerLoadMore:(LoadMoreTableView*)loadMoreTableView
{
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)stopLoading {
    myTableView.loadMoreTableIsLoadingMore = NO;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
