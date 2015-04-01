//
//  PageContentViewController.h
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property NSUInteger pageIndex;
@property NSString *imageFile;
@end
