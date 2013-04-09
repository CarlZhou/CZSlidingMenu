//
//  CZSlidingMenu.m
//  CZSlidingMenu
//
//  Created by Carl on 2013-04-08.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import "CZSlidingMenu.h"
#import "QuartzCore/QuartzCore.h"

@implementation CZSlidingMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setMultipleTouchEnabled:YES];
        
        menuTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        menuTitleLabel.textAlignment = NSTextAlignmentCenter;
        menuTitleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:menuTitleLabel];
        
        swipeRightView = [[UIView alloc] initWithFrame:CGRectMake(0 - self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        swipeRightView.backgroundColor = [UIColor greenColor];
        [self addSubview:swipeRightView];
        
        swipeLeftView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        swipeLeftView.backgroundColor = [UIColor yellowColor];
        [self addSubview:swipeLeftView];
        
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@synthesize swipeLeftActionHandler, swipeRightActionHandler;

#pragma mark - Cell layout

- (void)setMenuTitle:(NSString *)title
{
    menuTitleLabel.text = title;
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor redColor]];
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self];
        touchStartPoint = touchPoint;
    }];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self];
        
        CGFloat touchRightLength = touchPoint.x - touchStartPoint.x;
        CGFloat touchLeftLength = touchStartPoint.x - touchPoint.x;
        
        
        if (touchRightLength > self.frame.size.width)
        {
            [swipeRightView setFrame:CGRectMake(0, swipeRightView.frame.origin.y, swipeRightView.frame.size.width, swipeRightView.frame.size.height)];
            [menuTitleLabel setFrame:CGRectMake(self.frame.size.width, menuTitleLabel.frame.origin.y, menuTitleLabel.frame.size.width, menuTitleLabel.frame.size.height)];
        }
        else
        {
            [swipeRightView setFrame:CGRectMake(-self.frame.size.width + touchRightLength, swipeRightView.frame.origin.y, swipeRightView.frame.size.width, swipeRightView.frame.size.height)];
            [menuTitleLabel setFrame:CGRectMake(touchRightLength, menuTitleLabel.frame.origin.y, menuTitleLabel.frame.size.width, menuTitleLabel.frame.size.height)];
        }
        
        if (touchRightLength > (self.frame.size.width * 3/4))
        {
            swipeRightView.backgroundColor = [UIColor orangeColor];
        }
        else if(touchRightLength < (self.frame.size.width * 1/4))
        {
            swipeRightView.backgroundColor = [UIColor lightGrayColor];
        }
        else
        {
            swipeRightView.backgroundColor = [UIColor greenColor];
        }
        
        if (touchLeftLength > self.frame.size.width)
        {
            [swipeLeftView setFrame:CGRectMake(0, swipeLeftView.frame.origin.y, swipeLeftView.frame.size.width, swipeLeftView.frame.size.height)];
        }
        else
        {
            [swipeLeftView setFrame:CGRectMake(self.frame.size.width - touchLeftLength, swipeLeftView.frame.origin.y, swipeLeftView.frame.size.width, swipeLeftView.frame.size.height)];
        }
        
        if (touchLeftLength > (self.frame.size.width * 3/4))
        {
            swipeLeftView.backgroundColor = [UIColor brownColor];
        }
        else if (touchLeftLength < (self.frame.size.width * 1/4))
        {
            swipeLeftView.backgroundColor = [UIColor lightGrayColor];
        }
        else
        {
            swipeLeftView.backgroundColor = [UIColor yellowColor];
        }
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self];
        
        CGFloat touchLength = touchPoint.x - touchStartPoint.x;
        
        [swipeRightView setFrame:CGRectMake(0 - self.frame.size.width, swipeRightView.frame.origin.y, swipeRightView.frame.size.width, swipeRightView.frame.size.height)];
        swipeRightView.backgroundColor = [UIColor greenColor];
        
        [swipeLeftView setFrame:CGRectMake(self.frame.size.width, swipeLeftView.frame.origin.y, swipeLeftView.frame.size.width, swipeLeftView.frame.size.height)];
        swipeLeftView.backgroundColor = [UIColor yellowColor];
        
        [menuTitleLabel setFrame:CGRectMake(0, menuTitleLabel.frame.origin.y, menuTitleLabel.frame.size.width, menuTitleLabel.frame.size.height)];
        
    }];
}

- (void)touchesCanceled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
