//
//  DataCentre.m
//  wyzc
//
//  Created by HeQingshan on 15-05-05.
//  Copyright (c) 2015年 HeQingshan. All rights reserved.
//

#import "DataCentre.h"

#define STRISEMPTY(str) (str==nil || [str isEqualToString:@""])

#define cmd_name(proNmame,key,dic)\
{NSString *cvalue = [dic objectForKey:key];\
if (!STRISEMPTY(cvalue)) {\
self.proNmame = cvalue;\
}else{\
self.proNmame = @"";\
}}

@implementation DataCentre

@end

@implementation HomeData

-(Class)Data_class {
    return [HomeDetail class];
}

@end

@implementation HomeDetail

-(Class)BannerList_class {
    return [BannerList class];
}

-(Class)AppointList_class {
    return [AppointList class];
}

@end

@implementation BannerList

@end

@implementation AppointList

@end