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
 
}


@end
