//
//  MenuViewController.h
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (weak, nonatomic) IBOutlet UILabel *userLikes;
@property (weak, nonatomic) IBOutlet UILabel *userMedals;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
