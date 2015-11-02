//
//  DialViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-01.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "DialViewController.h"
#import "CoverViewController.h"

@interface DialViewController ()
{
    dispatch_queue_t compassQueue;
}

@property (weak, nonatomic) IBOutlet UIImageView *pointerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dialImageView;
@property (weak, nonatomic) IBOutlet UILabel *loationLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentAngleLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationAngleLabel;
@property (weak, nonatomic) IBOutlet UIView *fakeView;
@property (weak, nonatomic) IBOutlet UITabBar *dialMenu;

@end

@implementation DialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dialMenu.delegate = self;
    
    [self.fakeView setUserInteractionEnabled:YES];
    /*[self.pointerImageView setUserInteractionEnabled:YES];
    [self.dialImageView setUserInteractionEnabled:YES];
    [self.loationLabel setUserInteractionEnabled:YES];
    [self.distanceLabel setUserInteractionEnabled:YES];
    [self.currentAngleLabel setUserInteractionEnabled:YES];
    [self.locationAngleLabel setUserInteractionEnabled:YES];*/
    
    if (!compassQueue)
    {
        compassQueue = dispatch_queue_create("com.skanderjabouzi.queue", NULL);
    }

    
    
    CLLocationManager *locationManager = [[CLLocationManager alloc]  init];
    [self setLocationManager:locationManager];
    
    self.locationManager.delegate = self;
    
    dispatch_async(compassQueue, ^{
        if([CLLocationManager headingAvailable]) {
            [   self.locationManager startUpdatingHeading];
        }
    });
}

- (void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    dispatch_async(dispatch_get_main_queue(), ^{
        double degrees = newHeading.magneticHeading;
        double radians = degrees * M_PI / 180;
        [self pointerImageView].transform = CGAffineTransformMakeRotation(radians);
        [[self locationAngleLabel] setText:[NSString stringWithFormat:@"%d",(int)degrees]];
    });
    //NSLog(@"Magnetic Heading: %f", newHeading.magneticHeading);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem: %ld", (long)item.tag);
    if (item.tag == 0)
    {
        [self performSegueWithIdentifier:@"settingsSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
