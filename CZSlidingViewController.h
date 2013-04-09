//
//  CZSlidingViewController.h
//  CZSlidingMenu
//
//  Created by Carl on 2013-04-08.
//  Copyright (c) 2013 Carl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZSlidingMenu.h"

@interface CZSlidingViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    CZSlidingMenu *slidingMenu;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *menuData;

@end
