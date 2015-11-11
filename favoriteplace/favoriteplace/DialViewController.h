//
//  DialViewController.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-01.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationDataSource.h"
#import "FavoriteDataSource.h"
#import "GeoCalculations.h"

@interface DialViewController : UIViewController <CLLocationManagerDelegate, UITabBarDelegate, UIGestureRecognizerDelegate> {
    //CLLocationManager *_locationManager;
}


@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,retain) UITapGestureRecognizer *singleTapGestureRecognizer;

@property LocationDataSource *locationDataSource;
@property FavoriteDataSource *favoriteDataSource;
@property Location *location;
@property Favorite *favorite;
@property GeoCalculations *geoCalculations;

@property float heading;
@property float distance;

-(void) setTextFieds;

@end
