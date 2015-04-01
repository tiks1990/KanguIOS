//
//  ProductosViewController.h
//  Kangu
//
//  Created by Heinz Sohm on 2/24/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetalleProductoCollectionViewCell.h"

@interface ProductosViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
