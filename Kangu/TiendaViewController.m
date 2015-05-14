//
//  TiendaViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 5/11/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "TiendaViewController.h"
#import "DetalleProductoCollectionViewCell.h"
#import <Parse/Parse.h>

@interface TiendaViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labprueba;
@property (weak, nonatomic) IBOutlet UILabel *infoTienda;
@property (weak, nonatomic) IBOutlet UIImageView *bannerTienda;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TiendaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *theNib = [UINib nibWithNibName:@"DetalleProductoCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:theNib forCellWithReuseIdentifier:@"productDetail"];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.labprueba setText:[NSString stringWithFormat:@"En esta tienda hay %i productos", self.productos.count]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.productos count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DetalleProductoCollectionViewCell * cell = (DetalleProductoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"celdaTest" forIndexPath:indexPath];
    //DetalleProductoCollectionViewCell * cell = (DetalleProductoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"productDetail" forIndexPath:indexPath];
    [cell.favbut setImage:[UIImage imageNamed:@"estrella"] forState:UIControlStateNormal];
    [cell.favbut setImage:[UIImage imageNamed:@"estrellaAmarilla"] forState:UIControlStateSelected];
    return cell;
}
/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake(284/2, 318/2);
    return size;
}
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"showCoupon" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
