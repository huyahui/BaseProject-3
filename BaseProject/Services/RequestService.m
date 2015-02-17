//
//  RequestService.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/17.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "RequestService.h"

@implementation RequestService

-(id)initRequest {
    self = [super init];
    if (self) {
        self.url =   [NSString stringWithFormat:@"%@%@",kWebService_space,kVersionURL];
    }
    return self;
}

@end
