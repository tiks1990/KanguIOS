//
//  MenuViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "MenuViewController.h"
//#import "MTMovintracks.h"

@interface MenuViewController ()

@end

@implementation MenuViewController{
    NSArray *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    menu=@[@"GEO-LOC PROFILE",@"PERFIL COMPRAS", @"MI CUENTA" , @"PRIVACIDAD", @"TERMINOS DE USO",@"SOBRE NOSOTROS",@"HOME"];
    // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openModalView:) name:kShowModalViewNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [menu count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text=CellIdentifier;
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Semibold" size:14];
    return cell;
}
- (void) openModalView: (NSNotification*) notification{
    UIViewController* view=notification.object;
    [self presentViewController: view animated:YES completion:nil];
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
