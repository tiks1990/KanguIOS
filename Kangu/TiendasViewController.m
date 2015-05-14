//
//  TiendasViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/6/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "TiendasViewController.h"
#import "SucursalesViewController.h"
#import "MBProgressHUD.h"
#import "TiendaCell.h"
#import <Parse/Parse.h>

@interface TiendasViewController ()

@end

@implementation TiendasViewController{
    NSArray *tiendas;
    NSMutableArray *fotos;
    NSMutableArray *logos;
    NSInteger selecIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [hud setDetailsLabelText:@"Cargando tiendas"];
    //tiendas=@[@"ZARA",@"GMO", @"AEROPOSTAL", @"NORTH FACE"];
    fotos = [[NSMutableArray alloc] init];
    logos=[[NSMutableArray alloc] init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    PFQuery *query = [PFQuery queryWithClassName:@"Tienda"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                 NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[object objectForKey:@"foto"]]];
                [fotos addObject:data];
                 NSData *data2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[object objectForKey:@"logo"]]];
                [logos addObject:data2];
            }
            tiendas=objects;
            [self.tableView reloadData];
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    NSLog(@"Getting the latest config...");
    [PFConfig getConfigInBackgroundWithBlock:^(PFConfig *config, NSError *error) {
        if (!error) {
            NSLog(@"Yay! Config was fetched from the server.");
        } else {
            NSLog(@"Failed to fetch. Using Cached Config.");
            config = [PFConfig currentConfig];
        }
        
        NSString *welcomeMessage = config[@"testMessage"];
        if (!welcomeMessage) {
            NSLog(@"Falling back to default message.");
            welcomeMessage = @"Welcome!";
        }
        NSLog(@"Welcome Messsage = %@", welcomeMessage);
    }];
    
    UINib *theNib = [UINib nibWithNibName:@"DetailsTableViewCell" bundle:nil];
    [self.tableView registerNib:theNib forCellReuseIdentifier:@"tiendaCell"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 149;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tiendas count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TiendaCell *cell = (TiendaCell *)[tableView dequeueReusableCellWithIdentifier:@"tiendaCell"];
    if (cell == nil) {
        cell = [[TiendaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tiendaCell"];
    }
    NSDictionary *actual = tiendas[indexPath.row];
    [cell.backImage setImage:[UIImage imageWithData:fotos[indexPath.row]]];
    [cell.logo setImage:[UIImage imageWithData:logos[indexPath.row]]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selecIndex=indexPath.row;
    [self performSegueWithIdentifier:@"sucShow" sender:self];
   
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SucursalesViewController *nextVC = (SucursalesViewController *)[segue destinationViewController];
    PFObject *actual = tiendas[selecIndex];
   
    PFRelation *relation = [actual relationForKey:@"sucursales"];
    
    // generate a query based on that relation
    PFQuery *query = [relation query];
    NSArray* sucursales = [query findObjects];
    nextVC.sucursales = [[NSMutableArray alloc] initWithArray:sucursales];
     NSLog(sucursales.description);
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
