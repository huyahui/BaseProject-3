//
//  HttpInfo.h
//  GFMusic
//
//  Created by HeQingshan on 15-05-05.
//  Copyright (c) 2015年 HeQingshan. All rights reserved.
//

#import "Jastor.h"

typedef enum {
    HTTP_BEGIN = -1,
    Http_getHomeData,  //获取职业方向列表
    Http_getBrandList,
    HTTPTYPE_END,
}HTTPTYPE;



@interface HttpInfo : Jastor
@property(nonatomic,strong) NSString *className;
@property(nonatomic,strong) NSNumber *httpType;
-(id) initWithInfo:(NSString *)cn type:(HTTPTYPE)htype;
@end

@interface HttpMethod : NSObject
+(HttpMethod *) sharedMethod;
-(Class) typeClass:(HTTPTYPE )type;
@end
