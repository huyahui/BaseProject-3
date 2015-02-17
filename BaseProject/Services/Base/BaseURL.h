//
//  SMBaseURL.h
//  App
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicHead.h"
#import "SBJson.h"
#import "SMCallWebService.h"

@interface BaseURL : PublicHead
{
    NSString * url;   //请求地址
}
@property(nonatomic,strong)NSString * url;
@property(nonatomic,strong)NSString *postString;

- (void)request:(void(^)(NSDictionary *dict,BOOL isSuccess))newBlock;

@end
