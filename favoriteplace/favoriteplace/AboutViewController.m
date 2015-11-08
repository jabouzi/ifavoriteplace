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
    self.alertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    array = @[@"Skander1", @"Skander2", @"Skander3", @"Skander4", @"Skander5", @"Skander6", @"Skander7", @"Skander8"];
    // init table view
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 380, 380) style:UITableViewStylePlain];
    self.tableView.sectionHeaderHeight = 0.0;
    self.tableView.sectionFooterHeight = 0.0;
    //self.tableView.tableFooterView = [UIView new];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius=5;
    [self.tableView reloadData];
    
    //self.tableView.backgroundColor = [UIColor cyanColor];
    
    // add to canvas
    //[self.tempView addSubview:self.tableView];
    
}

- (IBAction)alertClicked:(id)sender {
    [self showAlert];
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return array.count;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    
    // Similar to UITableViewCell, but
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Just want to test, so I hardcode the data
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(void)showAlert
{
    // Here we need to pass a full frame
    CustomIOSAlertView *dialogView = [[CustomIOSAlertView alloc] init];
    dialogView.backgroundColor = [UIColor blackColor];
    // Add some custom content to the alert view
    [dialogView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [dialogView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", @"Close2", nil]];
    [dialogView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [dialogView setOnButtonTouchUpInside:^(CustomIOSAlertView *dialogView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[dialogView tag]);
        [dialogView close];
    }];
    
    [dialogView setUseMotionEffects:true];
    
    // And launch the dialog
    [dialogView show];
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)dialogView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[dialogView tag]);
    [dialogView close];
}

- (UIView *)createDemoView
{
    //self.alertView.backgroundColor = [UIColor blackColor];
    [self.alertView addSubview:self.tableView];
    
    return self.alertView;
}

@end
