//
//  LogInViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "LogInViewController.h"
#import "SWRevealViewController.h"

@interface LogInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *password;

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)logIn:(id)sender{
    if([self.user.text isEqualToString:@"heinz@proximity2u.com"])
    {
        if([self.password.text isEqualToString:@"qwerasdf"]){
            UIStoryboard *storyboard= [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
            SWRevealViewController *vc = (SWRevealViewController *)[storyboard instantiateViewControllerWithIdentifier:@"revealController"];
            [self presentViewController:vc animated:YES completion:nil];
        }
        else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Acceso invalido" message:@"Parece que has digitado la contraseña de forma errada" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:okAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Acceso invalido" message:@"El usuario no existe por favor verificalo o abre una cuenta con nosotros" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
  
}
-(IBAction)backgroundTouched:(id)sender{
    [self.user resignFirstResponder];
    [self.password resignFirstResponder];
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
