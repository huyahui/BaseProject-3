//
//  LocationService.h
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^CompleteBlock_m)(BOOL finished);
@interface LocationService : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager * locationManager;
    CLLocationCoordinate2D curLocation;
    CompleteBlock_m completeBlock_;
}
@property(nonatomic,assign)CLLocationCoordinate2D curLocation;
- (void)getCurPosition:(CompleteBlock_m)completeBlock;
@end
