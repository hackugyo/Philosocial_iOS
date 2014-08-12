//
//  PHSViewController.m
//  Philosocial
//
//  Created by kwatanabeMac on 2014/08/12.
//  Copyright (c) 2014年 hackugyo. All rights reserved.
//

#import "PHSViewController.h"
#import "PHSContentViewController.h"

@interface PHSViewController ()

@end

@implementation PHSViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataSource = self;
    self.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ViewPagerController

/**
 * Asks dataSource how many tabs will there be.
 *
 * @param viewPager The viewPager that's subject to
 * @return Number of tabs
 */
- (NSUInteger)numberOfTabsForViewPager:(ViewPagerController *)viewPager
{
    return 3;
}
/**
 * Asks dataSource to give a view to display as a tab item.
 * It is suggested to return a view with a clearColor background.
 * So that un/selected states can be clearly seen.
 *
 * @param viewPager The viewPager that's subject to
 * @param index The index of the tab whose view is asked
 *
 * @return A view that will be shown as tab at the given index
 */

- (UIView *)viewPager:(ViewPagerController *)viewPager viewForTabAtIndex:(NSUInteger)index
{
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"tab #%i", index];
    [label sizeToFit];
    
    return label;
}

#pragma mark - ViewPagerDataSource
- (UIViewController *)viewPager:(ViewPagerController *)viewPager contentViewControllerForTabAtIndex:(NSUInteger)index {
    
    PHSContentViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    
    return cvc;
}



@end
