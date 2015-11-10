//
//  FavoriteFavoriteViewController.m
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
    self.locationManager = [[CLLocationManager alloc] init];
    self.geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.favoriteDataSource = [[FavoriteDataSource alloc] init];
    self.favorite = [[Favorite alloc] init];
    
    self.count = self.favoriteDataSource.getFavoriteCount;
    NSLog(@" COUNT : %d", self.count);
    if (self.count > 0)
    {
        self.favorite = [self.favoriteDataSource getFavorite:1];
        [self setTextFieds];
    }
}

-(void) setTextFieds
{
    [self latitude].text = self.favorite.latitude;
    [self longitude].text = self.favorite.longitude;
    [self city].text = self.favorite.city;
    [self country].text = self.favorite.country;
    [self state].text = self.favorite.state;
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
- (IBAction)searchFavorite:(id)sender
{
    NSLog(@"Resolving the Address");
    [[self geocoder] geocodeAddressString:[[self search] text] completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found count %d, placemarks: %@, error: %@ ", [placemarks count] , placemarks, error);
        
        //[self setPlacemark:_placemark];
        if (error == nil && [placemarks count] > 0) {
            if ([placemarks count] == 1) {
                [self setPlacemark:[placemarks lastObject]];
                //NSLog(@"%@", [self placemark]);
                [[self latitude] setText:[NSString stringWithFormat:@"%lf", [self placemark].location.coordinate.latitude]];
                [[self longitude] setText:[NSString stringWithFormat:@"%lf", [self placemark].location.coordinate.longitude]];
                [[self city] setText:[[self placemark] locality]];
                [[self country] setText:[[self placemark] country]];
                [[self state] setText:[[self placemark] administrativeArea]];
                [self.view endEditing:YES];
            }
            else
            {
                [self.view endEditing:YES];
                self.searchResults = placemarks;
                [self showAlert:sender];
            }
         } else {
         NSLog(@"%@", error.debugDescription);
         }
    } ];

}

- (IBAction)saveFavorite:(id)sender {
    
}


-(void)showAlert:sender
{
    
    self.actionSheet = [UIAlertController
                        alertControllerWithTitle:@"Search Result"
                        message:@"Select Location"
                        preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    // Action Buttons
    for (CLPlacemark *actionName in self.searchResults){
        self.cancelAction = [UIAlertAction
                             actionWithTitle:[NSString stringWithFormat:@" %@ ,%@, %@", actionName.locality, actionName.administrativeArea, actionName.country]
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction *action)
                             {
                                 [[self latitude] setText:[NSString stringWithFormat:@"%lf", actionName.location.coordinate.latitude]];
                                 [[self longitude] setText:[NSString stringWithFormat:@"%lf", actionName.location.coordinate.longitude]];
                                 [[self city] setText:[actionName locality]];
                                 [[self country] setText:[actionName country]];
                                 [[self state] setText:[actionName administrativeArea]];
                             }];
        [self.actionSheet addAction:self.cancelAction];
    }
    
    self.cancelAction = [UIAlertAction
                         actionWithTitle:@"Cancel"
                         style:UIAlertActionStyleDestructive
                         handler:^(UIAlertAction *action)
                         {
                             NSLog(@"Cancel action");
                         }];
    [self.actionSheet addAction:self.cancelAction];
    
    self.actionSheet.view.subviews.firstObject.backgroundColor = [UIColor blackColor];
    
    UIView *subview = self.actionSheet.view.subviews.firstObject;
    UIView *alertContentView = subview.subviews.firstObject;
    alertContentView.backgroundColor = [UIColor whiteColor];
    self.actionSheet.view.tintColor = [UIColor blackColor];
    self.actionSheet.view.layer.cornerRadius = 5;
    
    UIPopoverPresentationController *popOver = self.actionSheet.popoverPresentationController;
    popOver.sourceView  = sender;
    [self.actionSheet.popoverPresentationController setPermittedArrowDirections:0];
    
    //For set action sheet to middle of view.
    CGRect rect = CGRectZero;
    rect.origin.x = CGRectGetMidX(self.view.bounds)-self.view.frame.origin.x/2.0;
    rect.origin.y = CGRectGetMidY(self.view.bounds)-self.view.frame.origin.y/2.0;
    
    self.actionSheet.popoverPresentationController.sourceView = self.view;
    self.actionSheet.popoverPresentationController.sourceRect = rect;
    
    [self presentViewController:self.actionSheet animated:YES completion:nil];
    // Destruction Button
    
    // Cancel Button
    //[actionSheet setCancelButtonIndex: [actionSheet addButtonWithTitle:@"Cancel"]];
    
    // Present Action Sheet
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

@end
