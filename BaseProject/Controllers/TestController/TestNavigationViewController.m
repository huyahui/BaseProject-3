//
//  TestNavigationViewController.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/9.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "TestNavigationViewController.h"
#import "UIPlaceHolderTextView.h"

@interface TestNavigationViewController ()

@end

@implementation TestNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPlaceHolderTextView *view = [[UIPlaceHolderTextView alloc] initWithFrame:CGRectMake(10, 20, WIDTH_FULL_SCREEN - 20, 100)];
    view.layer.borderColor = K_CellLineColor.CGColor;
    view.layer.borderWidth = 0.5;
    view.font = K_Font_12;
    view.layer.cornerRadius = 8;
    view.textColor = K_NavTitleColor;
    view.placeholder = @"This is a test";
    [self.view addSubview:view];
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
