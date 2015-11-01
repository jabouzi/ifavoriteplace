//
//  DialViewController.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-01.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DialViewController : UIViewController <CLLocationManagerDelegate, UITabBarDelegate> {
    CLLocationManager *_locationManager;
}

@property(nonatomic,retain) CLLocationManager *locationManager;
//@property(nonatomic,retain) UITabBar *dialMenu;

@end
