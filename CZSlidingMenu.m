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
        
//        swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeLeft:)];
//        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//        swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeRight:)];
//        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
//        
//        [self addGestureRecognizer:swipeLeft];
//        [self addGestureRecognizer:swipeRight];
        
        menuTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        menuTitleLabel.textAlignment = NSTextAlignmentCenter;
        menuTitleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:menuTitleLabel];
        
        swipeLeftView = [[UIView alloc] initWithFrame:CGRectMake(0 - self.frame.size.width*2, 0, self.frame.size.width*2, self.frame.size.height)];
        swipeLeftView.backgroundColor = [UIColor greenColor];
        [self addSubview:swipeLeftView];
        
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@synthesize swipeLeftActionHandler, swipeRightActionHandler;

#pragma mark - Cell layout

- (void)setMenuTitle:(NSString *)title
{
    menuTitleLabel.text = title;
}

//#pragma mark - Swipe Action
//
//- (void)didSwipeLeft:(UISwipeGestureRecognizer *)recognizer
//{
//    if (swipeLeftActionHandler)
//        swipeLeftActionHandler();
//    NSLog(@"did swipe left");
//}
//
//- (void)didSwipeRight:(UISwipeGestureRecognizer *)recognize
//{
//    if (swipeRightActionHandler)
//        swipeRightActionHandler();
//    NSLog(@"did swipe right");
//}

#pragma mark - Touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor redColor]];
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self];
        touchStartPoint = touchPoint;
        
        
        
        //        // Draw a red circle where the touch occurred
        //        UIView *touchView = [[UIView alloc] init];
        //        [touchView setBackgroundColor:[UIColor redColor]];
        //        touchView.frame = CGRectMake(touchPoint.x, touchPoint.y, 30, 30);
        //        touchView.layer.cornerRadius = 15;
        //        [self addSubview:touchView];
    }];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [touches enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        // Get a single touch and it's location
        UITouch *touch = obj;
        CGPoint touchPoint = [touch locationInView:self];
        
        CGFloat touchLeftLength = touchPoint.x - touchStartPoint.x;
        
        [swipeLeftView setFrame:CGRectMake(-self.frame.size.width*2 + touchLeftLength, swipeLeftView.frame.origin.y, swipeLeftView.frame.size.width, swipeLeftView.frame.size.height)];
        
        
        
//        // Draw a red circle where the touch occurred
//        UIView *touchView = [[UIView alloc] init];
//        [touchView setBackgroundColor:[UIColor redColor]];
//        touchView.frame = CGRectMake(touchPoint.x, touchPoint.y, 30, 30);
//        touchView.layer.cornerRadius = 15;
//        [self addSubview:touchView];
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

        [swipeLeftView setFrame:CGRectMake(0 - self.frame.size.width*2, swipeLeftView.frame.origin.y, swipeLeftView.frame.size.width, swipeLeftView.frame.size.height)];
        
    }];
}

- (void)touchesCanceled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
