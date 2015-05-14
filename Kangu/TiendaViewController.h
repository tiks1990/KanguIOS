//
//  TiendaViewController.h
//  Kangu
//
//  Created by Heinz Sohm on 5/11/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiendaViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property NSMutableArray *productos;
@end
