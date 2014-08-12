//
//  PHSWebViewController.m
//  Philosocial
//
//  Created by kwatanabeMac on 2014/08/12.
//  Copyright (c) 2014年 hackugyo. All rights reserved.
//

#import "PHSWebViewController.h"

@interface PHSWebViewController () {
    NSString *_urlString;
}
@end

@implementation PHSWebViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)urlString
{
    _urlString = urlString;
}


#pragma mark - life cycle

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
    NSURL *url = [NSURL URLWithString:_urlString];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	[_webView loadRequest:req];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
