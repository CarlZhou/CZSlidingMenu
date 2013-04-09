//
//  CZSlidingMenu.h
//  CZSlidingMenu
//
//  Created by Carl on 2013-04-08.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZSlidingMenu : UIView
{
    UILabel *menuTitleLabel;
    UIColor *backgroundColor;
    UIView *swipeLeftView;
    UIView *swipeRightView;
    void (^swipeLeftActionHandler)(void);
    void (^swipeRightActionHandler)(void);
    CGPoint touchStartPoint;
}

@property (nonatomic, strong) void (^swipeLeftActionHandler)(void);
@property (nonatomic, strong) void (^swipeRightActionHandler)(void);

- (void)setMenuTitle:(NSString *)title;
- (void)setSwipeLeftActionHandler:(void (^)(void))swipeLeftActionHandler;
- (void)setSwipeRightActionHandler:(void (^)(void))swipeRightActionHandler;

@end
