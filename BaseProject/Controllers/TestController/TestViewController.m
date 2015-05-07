//
//  TestViewController.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "TestViewController.h"
#import "TestEGOViewController.h"
#import "TestMBProgressHUDViewController.h"
#import "TestNavigationViewController.h"

@interface TestViewController () {
    NSMutableArray *dataArray;
}

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础功能展示";
    
    dataArray = [NSMutableArray arrayWithObjects:@"导航栏测试",@"MBProgressHUD测试",@"EGOTableViewPullRefresh测试", nil];
    
    myTableView = [[PullTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_FULL_SCREEN, HEIGHT_FULL_VIEW) style:UITableViewStylePlain];
    if (IOS7_LATER) {
        myTableView.separatorInset = UIEdgeInsetsZero;
    }
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.pullDelegate = self;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            TestNavigationViewController *ctrl = [[TestNavigationViewController alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        case 1:
        {
            TestMBProgressHUDViewController *ctrl = [[TestMBProgressHUDViewController alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        case 2:
        {
            TestEGOViewController *ctrl = [[TestEGOViewController alloc] init];
            [self.navigationController pushViewController:ctrl animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - PullTableViewDelegate
- (void)pullTableViewDidTriggerRefresh:(PullTableView*)pullTableView {
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)pullTableViewDidTriggerLoadMore:(PullTableView*)pullTableView {
    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:2];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)stopLoading {
    myTableView.pullTableIsRefreshing = NO;
    myTableView.pullTableIsLoadingMore = NO;
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

@end
