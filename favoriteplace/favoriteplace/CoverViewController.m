//
//  CoverViewController.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-01.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "CoverViewController.h"

@interface CoverViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@end

@implementation CoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.coverImageView setUserInteractionEnabled:YES];
    // Do any additional setup after loading the view.
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
