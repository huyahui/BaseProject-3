//
//  DataCentre.h
//  wyzc
//
//  Created by HeQingshan on 15-05-05.
//  Copyright (c) 2015年 HeQingshan. All rights reserved.
//


#import "Jastor.h"

@interface DataCentre : Jastor
@property(nonatomic,strong) NSNumber *Result;
@property(nonatomic,strong) NSString *Message;
@end

@class HomeDetail;
@interface HomeData : DataCentre
@property(nonatomic,strong) HomeDetail *Data;

@end

@class BannerList;
@class AppointList;
@interface HomeDetail : Jastor

@property(nonatomic,strong) NSString *Sid;
@property(nonatomic,strong) NSArray *BannerList;
@property(nonatomic,strong) NSArray *AppointList;
@property(nonatomic,strong) NSNumber *MsgCount;
@property(nonatomic,strong) NSNumber *UnAcceptCount;

@end

@interface BannerList : Jastor

@property(nonatomic,strong) NSString *ImagePath;
@property(nonatomic,strong) NSString *Link;

@end

@interface AppointList : Jastor


@end

