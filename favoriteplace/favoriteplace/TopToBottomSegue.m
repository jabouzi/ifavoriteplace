//
//  TopToBottomSegue.m
//  CustomSegueExample
//
//  Created by Skander Jabouzi on 2015-10-29.
//  Copyright © 2015 ITinance GmbH. All rights reserved.
//

#import "TopToBottomSegue.h"

@implementation TopToBottomSegue

-(void)perform
{
    
    UIViewController* source = (UIViewController *)self.sourceViewController;
    UIViewController* destination = (UIViewController *)self.destinationViewController;
    
    CGRect sourceFrame = source.view.frame;
    sourceFrame.origin.y = sourceFrame.size.height;
    
    CGRect destFrame = destination.view.frame;
    destFrame.origin.y = -destination.view.frame.size.height;
    destination.view.frame = destFrame;
    
    destFrame.origin.y = 0;
    
    [source.view.superview addSubview:destination.view];
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         source.view.frame = sourceFrame;
                         destination.view.frame = destFrame;
                     }
                     completion:^(BOOL finished) {
                         UIWindow *window = source.view.window;
                         [window setRootViewController:destination];
                     }];
}


@end
