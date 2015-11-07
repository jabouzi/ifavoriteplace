//
//  SettingsViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-01.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIView *ContainerView;

@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.favoriteController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FavoriteLocation"];
    self.locationController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MyLocation"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SettingsBarClicked:(id)sender
{
    if ([sender selectedSegmentIndex] == 0)
    {
        [self hideContentController:self.favoriteController];
        [self displayContentController:self.locationController];
    }
    else if ([sender selectedSegmentIndex] == 1)
    {
        [self hideContentController:self.locationController];
        [self displayContentController:self.favoriteController];
    }
}

- (void) displayContentController: (UIViewController*) content {
    [self addChildViewController:content];
    content.view.frame = CGRectMake(0, 0, self.ContainerView.frame.size.width, self.ContainerView.frame.size.height);
    [self.ContainerView addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void) hideContentController: (UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}


@end
