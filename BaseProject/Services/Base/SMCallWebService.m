
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "SMCallWebService.h"
#import "PublicHead.h"
#import "SBJson.h"
#import "Reachability.h"

@implementation SMCallWebService
- (id)init
{
    self = [super init];
    if (self){
    }
    return self;
}
- (void)request:(NSString *)requestUrl post:(NSString *)body completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    completeBlock_ = [compleBlock copy];
    errorBlock_ = [errorBlock copy];
    //选择的网络类型
    NSString * result=[self getCurrentNet];
    if (result) {
        //设置网络环
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url cachePolicy: NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [req setHTTPMethod:@"POST"];

    if (body){
        [req setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    }
    PublicHead * head =[[PublicHead alloc] init];
    NSDictionary * dictionary = [NSDictionary dictionaryWithObjectsAndKeys:head.platform,@"platform",head.clientVersion,@"clientVersion",head.platform,@"platform",head.protocolVersion,@"protocolVersion",head.sourceId,@"sourceId",head.model,@"model",head.sid,@"sid",head.client,@"client", nil];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
          [req addValue:obj forHTTPHeaderField:key];
    }];
    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        data_ = [[NSMutableData alloc] init];
    }
    errorBlock_= ^(NSError *error){
    };
    CFRunLoopRun();
}
//选择的网络类型
-(NSString *)getCurrentNet
{
    NSString * result;
    //判断选择的网络类型
    Reachability * reach =[Reachability reachabilityWithHostName:@""];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
        {
            result = nil;
            // 没有网络连接
        }
            break;
        case ReachableViaWWAN:
        {
            result = @"3G";
            // 使用3G网络
        }
            break;
        case ReachableViaWiFi:
        {
            result = @"WiFi";
            // 使用WiFi网络
        }
            break;
    }
    return result;
}
#pragma mark NSURLConnectionDataDelegateNSURLConnectionDataDelegate的方法
// 刚开始接受响应时调用
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [data_ setLength: 0];
}
// 每接收到一部分数据就追加到webData中
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *) data {
    [data_ appendData:data];
}
// 出现错误时
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *) error {
    errorBlock_(error);
    CFRunLoopStop(CFRunLoopGetCurrent());
}
// 完成接收数据时调用
-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    completeBlock_(data_);
    CFRunLoopStop(CFRunLoopGetCurrent());
#if Debug
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSString * str = [[NSString alloc]initWithData:data_ encoding:NSUTF8StringEncoding];
        NSLog(@"str12:%@",str);
    });
#endif
}

@end
