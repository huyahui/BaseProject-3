
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "PublicHead.h"
#import "Singleton.h"

//接口公共头信息
#define kPlatform @"iPhone"
#define kUdid @"udid"
#define kClientVersion @"clientVersion"
#define kProtocolVersion @""
#define kSourceId @""
#define kModel @"model"
#define kSid @"sid"
#define kMobile @"mobile"
#define kInfo @"info1"

@implementation PublicHead
@synthesize platform,udid,clientVersion,protocolVersion,sourceId,model,sid,client;

-(id)init
{
    self = [super init];
    if (self) {
        platform = kPlatform;
        udid = kUdid;
        clientVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        protocolVersion = kProtocolVersion;
        sourceId = kSourceId;
        model = [[UIDevice currentDevice] model];
        client = @"1";
#if user_storage
        Singleton * single = [Singleton shareInstance];
        NSString * _sid = single.sid;
#else
        NSString * _sid = [[NSUserDefaults standardUserDefaults] objectForKey:kSid];
#endif
        if (!_sid) {
            _sid = @"";
        }
        sid  = _sid;
    }
    return self;
}
@end
