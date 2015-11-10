//
//  FavoriteLocationViewController.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-07.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "FavoriteDataSource.h"

@interface FavoriteLocationViewController : UIViewController <CLLocationManagerDelegate>

@property(nonatomic,retain) CLLocationManager *locationManager;
@property(nonatomic,retain) CLGeocoder *geocoder;
@property(nonatomic,retain) CLPlacemark *placemark;

@property (nonatomic, strong) UIAlertController *actionSheet;
@property (nonatomic, strong) UIAlertAction *cancelAction;

@property NSArray *searchResults;
@property FavoriteDataSource * favoriteDataSource;
@property Favorite * favorite;

@property int count;

-(void) setTextFieds;
-(void) showAlert:(id)sender;


@end
