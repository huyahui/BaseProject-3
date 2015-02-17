
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMCallWebService;
@protocol requestError <NSObject>
@end

//代码块
typedef void(^CompleteBlock_t)(NSData * data);
typedef void(^ErrorBlock_t)(NSError *error);
@interface SMCallWebService : NSObject<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData * data_;
    CompleteBlock_t completeBlock_;
    ErrorBlock_t errorBlock_;
}

- (void)request:(NSString *)requestUrl post:(NSString *)body completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

@end
