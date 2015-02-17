
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicHead : NSObject
{
    NSString * platform;  //客户端设备平台，如iPhone、 Android
    NSString * udid;      //设备唯一标示符
    NSString * clientVersion;//客户端版本号 如：1.0.0
    NSString * protocolVersion; //通讯协议版本号 如：1.0.0
    NSString * sourceId;//推广id
    NSString * model;  //手机型号，如“iphone4”
    NSString * sid;    //已登录用户的SessionId,用于验证用户登录状态，非空则用户已登录
    NSString *client;//表示是C端还是B端 1：C端，2：B端
}

@property (nonatomic,strong)NSString * platform;  //客户端设备平台，如iPhone、 Android
@property (nonatomic,strong)NSString * udid;      //设备唯一标示符
@property (nonatomic,strong)NSString * clientVersion;//客户端版本号 如：1.0.0
@property (nonatomic,strong)NSString * protocolVersion; //通讯协议版本号 如：1.0.0
@property (nonatomic,strong)NSString * sourceId;//推广id
@property (nonatomic,strong)NSString * model;  //手机型号，如“iphone4”
@property (nonatomic,strong)NSString * sid;    //已登录用户的SessionId,用于验证用户登录状态，非空则用户已登录
@property (nonatomic,strong)NSString * client; //表示是C端还是B端 1：C端，2：B端

@end
