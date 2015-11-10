//
//  MyLocationViewController.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-07.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationDataSource.h"


@interface MyLocationViewController : UIViewController <CLLocationManagerDelegate>

@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,retain) CLGeocoder *geocoder;
@property(nonatomic,retain) CLPlacemark *placemark;

@property LocationDataSource *locationDataSource;
@property Location *location;

@property int count;

-(void) setTextFieds;

@end
