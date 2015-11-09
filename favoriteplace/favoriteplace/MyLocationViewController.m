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
}

- (IBAction) detectMyLocation:(id)sender {
}

- (IBAction) saveMyLocation:(id)sender {
}

@end
