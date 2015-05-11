//
//  LogInViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "LogInViewController.h"
#import "SWRevealViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UIButton *signFB;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *bottomBorder = [[UIView alloc]
                            initWithFrame:CGRectMake(0,
                                                     self.user.frame.size.height - 1.0f,
                                                     self.user.frame.size.width,
                                                     1.0f)];
    
    bottomBorder.backgroundColor = [UIColor lightGrayColor];
    [self.user addSubview:bottomBorder];
    UIButton *info = [[UIButton alloc] initWithFrame:CGRectMake(self.password.frame.size.width-5.0f, 0, 5.0f, self.password.frame.size.height)];
    [self.password addSubview:info];
    
    UIView *bottomBorder2 = [[UIView alloc]
                             initWithFrame:CGRectMake(0,
                                                      self.password.frame.size.height - 1.0f,
                                                      self.password.frame.size.width,
                                                      1.0f)];
    
    bottomBorder2.backgroundColor = [UIColor lightGrayColor];
    [self.password addSubview:bottomBorder2];
    UIView *bottomBorder3 = [[UIView alloc]
                            initWithFrame:CGRectMake(0,
                                                     self.name.frame.size.height - 1.0f,
                                                     self.name.frame.size.width,
                                                     1.0f)];
    
    bottomBorder3.backgroundColor = [UIColor lightGrayColor];
    [self.name addSubview:bottomBorder3];
    
    [[self.signFB layer] setBorderWidth:1.0f];
    [[self.signFB layer] setBorderColor:[UIColor colorWithRed:(0/255.0) green:(22/255.0) blue:(249/255.0) alpha:1].CGColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)logIn:(id)sender{
    [PFUser logInWithUsernameInBackground:self.user.text password:self.password.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            if ([[user objectForKey:@"emailVerified"]boolValue ]) {
                                                UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
                                                SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
                                                [self presentViewController:vc animated:YES completion:nil];
                                            }
                                            else{
                                                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Acceso invalido" message:@"Por favor verifica tu correo haciendo click en el link" preferredStyle:UIAlertControllerStyleAlert];
                                                
                                                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                                                [alert addAction:okAction];
                                                [self presentViewController:alert animated:YES completion:nil];
                                                
                                            }
                                            // Do stuff after successful login.
                                            
                                        } else {
                                            // The login failed. Check error to see why.
                                            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Acceso invalido" message:@"El usuario no existe por favor verificalo o abre una cuenta con nosotros" preferredStyle:UIAlertControllerStyleAlert];
                                            
                                            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                                            [alert addAction:okAction];
                                            [self presentViewController:alert animated:YES completion:nil];
                                        }
                                    }];
    
  
}
-(IBAction)backgroundTouched:(id)sender{
    [self.user resignFirstResponder];
    [self.password resignFirstResponder];
    [self.name resignFirstResponder];
}
-(IBAction)fbSign:(id)sender{
    [PFFacebookUtils logInWithPermissions:@[@"public_profile",@"user_friends"]block:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in through Facebook!");
            UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
            SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
            [self presentViewController:vc animated:YES completion:nil];
        } else {
            NSLog(@"User logged in through Facebook!");
            UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
            SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
            [self presentViewController:vc animated:YES completion:nil];
        }
    }];
    
}
-(IBAction)skipPressed:(id)sender{
    UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"User" bundle:nil];
    SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
    [self presentViewController:vc animated:YES completion:nil];
    
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
