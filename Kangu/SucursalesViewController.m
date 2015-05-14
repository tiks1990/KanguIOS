//
//  SucursalesViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 5/11/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "SucursalesViewController.h"
#import <Parse/Parse.h>
#import "TiendaViewController.h"

@interface SucursalesViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fotoMarca;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelNumSucursales;

@end

@implementation SucursalesViewController
NSInteger selecIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.labelNumSucursales setText:[NSString stringWithFormat:@"Hay %i locales cerca a ti",self.sucursales.count]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selecIndex=indexPath.row;
    [self performSegueWithIdentifier:@"showStore" sender:self];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellSucursales"];
    NSDictionary *actualSuc = [self.sucursales objectAtIndex:indexPath.row];
    [cell.textLabel setText:[actualSuc objectForKey:@"name"]];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.sucursales count];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    PFObject *actual = self.sucursales[selecIndex];
    
    PFRelation *relation = [actual relationForKey:@"productos"];
    
    // generate a query based on that relation
    PFQuery *query = [relation query];
    NSArray* sucursales = [query findObjects];
    
    TiendaViewController *nextVC = (TiendaViewController *)[segue destinationViewController];
    nextVC.productos=[[NSMutableArray alloc] initWithArray:sucursales];
    

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
