//
//  SMBaseURL.m
//  App
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "BaseURL.h"

@implementation BaseURL
@synthesize url,postString;

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)request:(void(^)(NSDictionary *dict,BOOL isSuccess))newBlock {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        SMCallWebService * call = [[SMCallWebService alloc] init];
        [call request:self.url post:postString completeBlock:^(NSData *data){
            SBJsonParser * json =  [[SBJsonParser alloc] init];
            NSDictionary * dict = [NSDictionary dictionaryWithDictionary: (NSDictionary *)[json objectWithData:data]];
            newBlock(dict,YES);
        }errorBlock:^(NSError * error){
            newBlock(nil,NO);
        }];
    });
}

@end
