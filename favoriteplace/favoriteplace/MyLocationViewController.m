//
//  MyLocationViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-07.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *state;

@end

@implementation MyLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationDataSource = [[LocationDataSource alloc] init];
    self.location = [[Location alloc] init];
    
    self.count = self.locationDataSource.getLocationCount;
    NSLog(@" COUNT : %d", self.count);
    if (self.count > 0)
    {
        self.location = [self.locationDataSource getLocation:1];
        [self setTextFieds];
    }
}

-(void) setTextFieds
{
    [self latitude].text = self.location.latitude;
    [self longitude].text = self.location.longitude;
    [self city].text = self.location.city;
    [self country].text = self.location.country;
    [self state].text = self.location.state;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) detectMyLocation:(id)sender
{
    NSLog(@"detectMyLocation");
    [self locationManager].distanceFilter = kCLDistanceFilterNone;
    [self locationManager].desiredAccuracy = kCLLocationAccuracyBest;
    [[self locationManager] startUpdatingLocation];
    [[self locationManager] requestWhenInUseAuthorization];
}

- (IBAction) saveMyLocation:(id)sender
{
    [[self location] setLocationId:1];
    [[self location] setLatitude:[[self latitude] text]];
    [[self location] setLongitude:[[self longitude] text]];
    [[self location] setCity:[[self city] text]];
    [[self location] setCountry:[[self country] text]];
    [[self location] setState:[[self state] text]];
    
    if (self.count > 0)
    {
        
        [self.locationDataSource updateLocation:self.location];
    }
    else
    {
        [self.locationDataSource addLocation:self.location];
        self.count = self.locationDataSource.getLocationCount;
        NSLog(@" %d, %@", self.count, [self.locationDataSource getLocation:1]);
    }
    NSLog(@"saveMyLocation");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
        
        [[self latitude] setText:[NSString stringWithFormat:@"%lf", location.coordinate.latitude]];
        [[self longitude] setText:[NSString stringWithFormat:@"%lf", location.coordinate.longitude]];
        
        [[self locationManager] stopUpdatingLocation];
        
        NSLog(@"Resolving the Address");
        [[self geocoder] reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            //[self setPlacemark:_placemark];
            if (error == nil && [placemarks count] > 0) {
                [self setPlacemark:[placemarks lastObject]];
                //NSLog(@"%@", [self placemark]);
                [[self city] setText:[[self placemark] locality]];
                [[self country] setText:[[self placemark] country]];
                [[self state] setText:[[self placemark] administrativeArea]];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        }];
        
    }
}


@end
