//
//  PHSContentViewController.m
//  Philosocial
//
//  Created by kwatanabeMac on 2014/08/12.
//  Copyright (c) 2014年 hackugyo. All rights reserved.
//

#import "PHSContentViewController.h"
#import "PHSWebViewController.h"

@interface PHSContentViewController () {
    NSMutableArray *_objects;
}

@end

@implementation PHSContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger actualNumberOfRows = _objects.count;
    return (actualNumberOfRows == 0) ? 1 : _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSInteger actualNumberOfRows = _objects.count;
    if (actualNumberOfRows == 0) {
        cell.textLabel.text = @"Sync Calendar";
    } else {
        NSDate *object = _objects[indexPath.row];
        cell.textLabel.text = [object description];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


#pragma mark - Transition

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showCalendarSync"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSInteger actualNumberOfRows = _objects.count;
        if (actualNumberOfRows == 0) {
            //[[segue destinationViewController] setDetailItem:@"https://www.google.com/calendar/syncselect"];
            [[segue destinationViewController] setDetailItem:@"https://www.google.com/calendar/render?cid=ktju3jonf98solrasjg5tqucbk@group.calendar.google.com"];
        } else {
            NSDate *object = _objects[indexPath.row];
            // TODO something else
        }
    }

}
@end
