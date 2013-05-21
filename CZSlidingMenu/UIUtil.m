//
//  UIUtil.m
//  UWCourse
//
//  Created by Carl on 2013-03-28.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import "UIUtil.h"

@implementation UIUtil

- (UINavigationController *)getRootNaviViewController
{
    return (UINavigationController *)[[[UIApplication sharedApplication] keyWindow] rootViewController];
}

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")
                                              otherButtonTitles:nil];
        [alert show];
    });
}

+ (void)showNetworkUnavailableAlert
{
    [UIUtil showAlertWithTitle:@"Network Unavailable" andMessage:@"Please check connection and try later"];
}

+ (void)showNetworkErrorAlert
{
    [UIUtil showAlertWithTitle:@"Connection error" andMessage:@"Please try later"];
}

#pragma mark - sharedInstance

+ (UIUtil *)sharedInstance
{
    static UIUtil *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UIUtil alloc] init];
    });
    return sharedInstance;
}

@end
