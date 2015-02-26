//
//  ProductosViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 2/24/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "ProductosViewController.h"

@interface ProductosViewController ()

@end

@implementation ProductosViewController
NSArray *productosTienda;

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *theNib = [UINib nibWithNibName:@"DetalleProductoCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:theNib forCellWithReuseIdentifier:@"productDetail"];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    productosTienda =@[@"1",@"2"];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"Met1");
    return [productosTienda count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DetalleProductoCollectionViewCell * cell = (DetalleProductoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"productDetail" forIndexPath:indexPath];
    [cell.favbut setImage:[UIImage imageNamed:@"estrella"] forState:UIControlStateNormal];
    [cell.favbut setImage:[UIImage imageNamed:@"estrellaAmarilla"] forState:UIControlStateSelected];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(284, 318);
    return size;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
