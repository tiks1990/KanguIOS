//
//  TiendasViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/6/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "TiendasViewController.h"
#import "TiendaCell.h"
#import <Parse/Parse.h>

@interface TiendasViewController ()

@end

@implementation TiendasViewController{
    NSArray *tiendas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //tiendas=@[@"ZARA",@"GMO", @"AEROPOSTAL", @"NORTH FACE"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    PFQuery *query = [PFQuery queryWithClassName:@"Tienda"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
            tiendas=objects;
            [self.tableView reloadData];
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
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[actual objectForKey:@"foto"]]];
    [cell.backImage setImage:[UIImage imageWithData:data]];
    NSData *data2 = [NSData dataWithContentsOfURL:[NSURL URLWithString:[actual objectForKey:@"logo"]]];
    [cell.logo setImage:[UIImage imageWithData:data2]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

   
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
