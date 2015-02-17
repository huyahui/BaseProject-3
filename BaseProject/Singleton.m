//
//  Singleton.m
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/17.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "Singleton.h"

static Singleton * instance = nil;

@implementation Singleton

+(id)shareInstance
{
    if(instance == nil)
    {
        instance = [[super allocWithZone:nil] init];
    }
    return instance;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [Singleton shareInstance];
}

@end
