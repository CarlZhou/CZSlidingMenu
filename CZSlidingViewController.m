//
//  CZSlidingViewController.m
//  CZSlidingMenu
//
//  Created by Carl on 2013-04-08.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import "CZSlidingViewController.h"
#import "UIUtil.h"

@interface CZSlidingViewController ()

@end

@implementation CZSlidingViewController

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
	// Do any additional setup after loading the view.
    
    slidingMenu = [[CZSlidingMenu alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 60)/2, self.view.frame.size.width, 60)];
    [self.view addSubview:slidingMenu];
    
    [slidingMenu setMenuTitle:@"swipe me!"];
    
    [slidingMenu setSwipeRightViewTitle:@"swipe right"];
    [slidingMenu setSwipeRightActionHandler:^{
        [UIUtil showAlertWithTitle:@"Swipe Right Block invoked" andMessage:nil];
    }];
    
    [slidingMenu setSwipeMoreRightViewTitle:@"long swipe right"];
    [slidingMenu setSwipeMoreRightActionHandler:^{
        [UIUtil showAlertWithTitle:@"Long Swipe Right Block invoked" andMessage:nil];
    }];
    
    [slidingMenu setSwipeLeftViewTitle:@"swipe left"];
    [slidingMenu setSwipeLeftActionHandler:^{
        [UIUtil showAlertWithTitle:@"Swipe Left Block invoked" andMessage:nil];
    }];
    
    [slidingMenu setSwipeMoreLeftViewTitle:@"long swipe left"];
    [slidingMenu setSwipeMoreLeftActionHandler:^{
        [UIUtil showAlertWithTitle:@"Long Swipe Left Block invoked" andMessage:nil];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
