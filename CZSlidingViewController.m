//
//  CZSlidingViewController.m
//  CZSlidingMenu
//
//  Created by Carl on 2013-04-08.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import "CZSlidingViewController.h"
#import "CZSlidingMenuCell.h"

@interface CZSlidingViewController ()

@end

@implementation CZSlidingViewController

static NSString *cellIdentifier = @"CZSlidingMenuCell";

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
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
//    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
//    
//    self.menuData = [NSMutableArray array];
    
    slidingMenu = [[CZSlidingMenu alloc] initWithFrame:CGRectMake(0, 20, 320, 60)];
    [slidingMenu setMenuTitle:@"testMenu"];
    [self.view addSubview:slidingMenu];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.menuData.count;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CZSlidingMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[CZSlidingMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setMenuTitle:@"testMenu"];
    
    [cell setSwipeLeftActionHandler:^{
        NSLog(@"Did swipe left");
    }];
    
    [cell setSwipeRightActionHandler:^{
        NSLog(@"Did swipe right");
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
