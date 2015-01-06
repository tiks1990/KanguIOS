//
//  UserRegistrationViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "UserRegistrationViewController.h"
#import "SWRevealViewController.h"

@interface UserRegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *verifyPass;

@end

@implementation UserRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)registerUser:(id)sender{
    if ([self.user.text containsString:@"@"]) {
        if (![self.name.text isEqualToString:@""]) {
            if ([self.password.text isEqualToString:self.verifyPass.text]) {
                UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
                SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
                [self presentViewController:vc animated:YES completion:nil];
            }
            else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error en registro" message:@"Las contraseñas ingresadas no coinciden" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }

            
        }
        else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error en registro" message:@"No puedes dejar el nombre vacio" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error en registro" message:@"Parece que tu correo esta mal ingresado" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
-(IBAction)backgroundTouched:(id)sender{
    [self.user resignFirstResponder];
    [self.name resignFirstResponder];
    [self.age resignFirstResponder];
    [self.password resignFirstResponder];
    [self.verifyPass resignFirstResponder];
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
