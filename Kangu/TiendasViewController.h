//
//  TiendasViewController.h
//  Kangu
//
//  Created by Heinz Sohm on 1/6/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiendasViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationItem *titleItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
