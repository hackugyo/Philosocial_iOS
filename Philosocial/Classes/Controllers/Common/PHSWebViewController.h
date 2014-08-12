//
//  PHSWebViewController.h
//  Philosocial
//
//  Created by kwatanabeMac on 2014/08/12.
//  Copyright (c) 2014年 hackugyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHSWebViewController : UIViewController

- (void)setDetailItem:(id)urlString;
@property (nonatomic, strong) IBOutlet UIWebView *webView;
@end
