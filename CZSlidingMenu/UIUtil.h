//
//  UIUtil.h
//  UWCourse
//
//  Created by Carl on 2013-03-28.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIUtil : NSObject

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message;
+ (void)showNetworkUnavailableAlert;
+ (void)showNetworkErrorAlert;

@end
