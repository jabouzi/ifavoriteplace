//
//  AboutViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-07.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "AboutViewController.h"
//#import "TableCellViewController.h"

@interface AboutViewController ()

@property (weak, nonatomic) IBOutlet UIView *tempView;

@end

@implementation AboutViewController
{
    NSArray *array;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    array = @[@"Skander1, Montreal h1p2l3", @"Skander2, Montreal h2k2m5", @"Skander3", @"Skander4", @"Skander5"];
    
}

- (IBAction)alertClicked:(id)sender {
    [self showAlert:sender];
}


-(void)showAlert:sender
{

    self.actionSheet = [UIAlertController
                       alertControllerWithTitle:@"Search Result"
                       message:@"Select Location"
                       preferredStyle:UIAlertControllerStyleActionSheet];


    
    // Action Buttons
    for (NSString *actionName in array){
        self.cancelAction = [UIAlertAction
                        actionWithTitle:actionName
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction *action)
                        {
                            NSLog(@"%@ action", actionName);
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


@end
