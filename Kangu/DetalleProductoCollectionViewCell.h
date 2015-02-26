//
//  DetalleProductoCollectionViewCell.h
//  Kangu
//
//  Created by Heinz Sohm on 2/24/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetalleProductoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *favbut;
-(IBAction)selectFavorite:(id)sender;
@end
