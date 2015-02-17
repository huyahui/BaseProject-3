//
//  TestViewController.h
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "UIBaseViewController.h"

@interface TestViewController : UIBaseViewController<UITableViewDelegate,UITableViewDataSource,PullTableViewDelegate> {
    PullTableView *myTableView;
}

@end
