//
//  DetalleProductoCollectionViewCell.m
//  Kangu
//
//  Created by Heinz Sohm on 2/24/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "DetalleProductoCollectionViewCell.h"

@implementation DetalleProductoCollectionViewCell
-(IBAction)selectFavorite:(id)sender{
    if ([self.favbut isSelected]) {
        [self.favbut setSelected:NO];
    }
    else{
        [self.favbut setSelected:YES];
    }
    
}
@end
