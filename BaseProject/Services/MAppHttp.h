//
//  MAppHttp.h
//  MHTTPRequestTest
//
//  Created by HeQingshan on 15-05-05.
//  Copyright (c) 2015年 HeQingshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IHttpRequest.h"
#import "HttpInfo.h"

#define TEST_APP 0

#if TEST_APP

#define BASE_URL @"http://124.248.42.166:8082" //预上线环境

#else

#define BASE_URL @"http://www.sunmay.cn:8082"  //正式地址

#endif

#define TIMEOUT_Seconds  35.f

@interface MAppHttpJson : AFHTTPResponseSerializer

@end


@interface MAppHttp : IHttpRequest

-(void)requestAsynGet:(NSString*)methodName params:(NSDictionary*)dict type:(HTTPTYPE)type success:(SuccessBlock)success error:(FailureBlock)error;

-(void)requestAsynPost:(NSString*)methodName params:(NSDictionary*)dict type:(HTTPTYPE)type success:(SuccessBlock)success error:(FailureBlock)error;

@end





























