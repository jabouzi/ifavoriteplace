//
//  FavoriteLocationViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-07.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "FavoriteLocationViewController.h"

@interface FavoriteLocationViewController()

@property (weak, nonatomic) IBOutlet UITextField *search;
@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *country;
@property (weak, nonatomic) IBOutlet UITextField *state;


@end

@implementation FavoriteLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)searchLocation:(id)sender {
}

- (IBAction)saveLocation:(id)sender {
}

@end
