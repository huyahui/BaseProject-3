//
//  LocationService.m
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#import "LocationService.h"

@implementation LocationService
@synthesize curLocation;

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

//获得自己的当前的位置信息
- (void)getCurPosition:(CompleteBlock_m)completeBlock
{
    completeBlock_ = [completeBlock copy];
    //开始探测自己的位置
    if (locationManager==nil)
    {
        locationManager =[[CLLocationManager alloc] init];
    }
    
    if ([CLLocationManager locationServicesEnabled])
    {
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=10.0f;
        if (IOS_VERSION >= 8.0) {
            [locationManager requestAlwaysAuthorization];
        }
        [locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [manager stopUpdatingLocation];
    CLLocation * newLocation = (CLLocation *)[locations objectAtIndex:0];
    curLocation = newLocation.coordinate;
    completeBlock_(true);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString * errorString;
    [manager stopUpdatingLocation];
    switch ([error code]) {
        case kCLErrorDenied:
            //Access denied by user
            errorString = @"Access to Location Services denied by user";
            //Do something...
            break;
        case kCLErrorLocationUnknown:
            //Probably temporary...
            errorString = @"Location data unavailable";
            //Do something else...
            break;
        default:
            errorString = @"An unknown error has occurred";
        break;
    }
    completeBlock_(false);
}

@end
