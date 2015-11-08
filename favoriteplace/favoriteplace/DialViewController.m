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
@property (weak, nonatomic) IBOutlet UIImageView *pointer2ImageView;



@end

@implementation DialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double direction = 58 * M_PI / 180;
    [self pointer2ImageView].transform = CGAffineTransformMakeRotation(direction);
    
    self.dialMenu.delegate = self;
    
    [self.fakeView setUserInteractionEnabled:YES];
    
    self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    self.singleTapGestureRecognizer.delegate = self;
    [self.fakeView addGestureRecognizer:self.singleTapGestureRecognizer];
    
    if (!compassQueue)
    {
        compassQueue = dispatch_queue_create("com.skanderjabouzi.queue", NULL);
    }
    
    self.locationManager = [[CLLocationManager alloc]  init];
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
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0)
    {
        [self performSegueWithIdentifier:@"settingsSegue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"aboutSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if (touch.view == self.fakeView) return YES;
    return NO;
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    if (self.dialMenu.hidden == NO)  self.dialMenu.hidden = YES;
    else self.dialMenu.hidden = NO;
}


@end
