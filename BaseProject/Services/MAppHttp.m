//
//  MAppHttp.m
//  MHTTPRequestTest
//
//  Created by HeQingshan on 15-05-05.
//  Copyright (c) 2015年 HeQingshan. All rights reserved.
//

#import "MAppHttp.h"
#import "OpenUDID.h"

#define STRISEMPTY(str) (str==nil || [str isEqualToString:@""])

@implementation MAppHttpJson

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    return data;
}

@end

@interface MAppHttp()
{
    NSString *_uuid;
}

@end
@implementation MAppHttp

-(id) init
{
    self = [super init];
    if(self){
        _uuid = [OpenUDID value];
    }
    return self;
}

//异步Get方法
-(id) httpRequestAsynGet:(NSUInteger)type methodName:(NSString*)methodName data:(NSDictionary *)dic
{
    NSMutableString *strurl = [NSMutableString stringWithFormat:@"%@%@?",BASE_URL,methodName];
    if(dic){
        NSArray *arrkey = [dic allKeys];
        for (NSString *key in arrkey) {
            [strurl appendFormat:@"%@=%@&",key,[dic objectForKey:key]];
        }
    }
    if (!STRISEMPTY(_uuid)) {
        [strurl appendFormat:@"%@=%@&",@"deviceId",_uuid];
    }
    
    NSLog(@"Get Request Url:%@", strurl);

    __block __strong MAppHttp *bSelf = self;
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperationManager manager] GET:strurl parameters:nil timeOut:TIMEOUT_Seconds success:^(AFHTTPRequestOperation *operation, id responseObject) {
         [bSelf requestFinished:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [bSelf requestFailed:operation];
    }];
    operation.responseSerializer = [MAppHttpJson serializer];
    operation.tag = type;
    RequestID *rid = [RequestID requestIdWith:type object:operation andTag:_nextId++];
    [self addRequestId:rid];
    
    return rid;
}

//异步Post方法
-(id) httpRequestAsynPost:(NSUInteger)type methodName:(NSString*)methodName data:(NSDictionary *)dic
{
    __block __weak __typeof(self)weakSelf = self;
    NSString *strurl = [NSString stringWithFormat:@"%@%@",BASE_URL,methodName];
    NSLog(@"Post Method Url:%@", strurl);
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperationManager manager] POST:strurl parameters:nil timeOut:TIMEOUT_Seconds + 15 constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (dic) {
            NSArray *arr = [dic allKeys];
            for (NSString *key in arr) {
                id  value = [dic valueForKey:key];
                if ([value isKindOfClass:[NSData class]])
                {
                    [formData appendPartWithFileData:value name:key fileName:@"ap.png" mimeType:@"image/jpeg"];
                }
                else
                {
                    [formData appendPartWithFormData:[value dataUsingEncoding:NSUTF8StringEncoding] name:key];
                }
            }
            NSLog(@"Post Method Params:%@", dic);
        }
        if (!STRISEMPTY(_uuid)) {
            [formData appendPartWithFormData:[_uuid dataUsingEncoding:NSUTF8StringEncoding] name:@"deviceId"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [weakSelf requestFinished:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [weakSelf requestFailed:operation];
    }];
    operation.responseSerializer = [MAppHttpJson serializer];
    operation.tag = type;
    RequestID *rid = [RequestID requestIdWith:type object:operation andTag:_nextId++];
    [self addRequestId:rid];
    
    return rid;
}

//数据结构解析
-(id) analyProtocol:(NSDictionary *)dic type:(NSUInteger)type
{
    @autoreleasepool {
        Class c = [[HttpMethod sharedMethod] typeClass:(HTTPTYPE)type];
        id obj = nil;
        if(c){
            switch (type) {
                case Http_getHomeData:{
                    obj =  [[c alloc] initWithDictionary:dic];
                }
                    break;
                default:{
                    id data = [dic objectForKey:@"Data"];
                    if (data != [NSNull null] && [data isKindOfClass:[NSDictionary class]]) {
                        obj =  [[c alloc] initWithDictionary:data];
                    }
                    break;
                }
                break;
            }
        }
        if(obj)
        {
            return obj;
        }
        return dic;
    }
}

-(void)requestAsynGet:(NSString*)methodName params:(NSDictionary*)dict type:(HTTPTYPE)type success:(SuccessBlock)success error:(FailureBlock)error {
    self.sucBlock = success;
    self.failBlock = error;
    [self httpRequestAsynGet:type methodName:methodName data:dict];
}

-(void)requestAsynPost:(NSString*)methodName params:(NSDictionary*)dict type:(HTTPTYPE)type success:(SuccessBlock)success error:(FailureBlock)error {
    self.sucBlock = success;
    self.failBlock = error;
    [self httpRequestAsynPost:type methodName:methodName data:dict];
}

@end
