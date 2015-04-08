//
//  SignInViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "SignInViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>
#import "SWRevealViewController.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signFB;
@property (weak, nonatomic) IBOutlet UIButton *signG;
@property (weak, nonatomic) IBOutlet UIButton *signEMAIL;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.signFB layer] setBorderWidth:1.0f];
    [[self.signFB layer] setBorderColor:[UIColor colorWithRed:(0/255.0) green:(22/255.0) blue:(249/255.0) alpha:1].CGColor];
    [[self.signG layer] setBorderWidth:1.0f];
    [[self.signG layer] setBorderColor:[UIColor colorWithRed:(255/255.0) green:(16/255.0) blue:(50/255.0) alpha:1].CGColor];
    [[self.signEMAIL layer] setBorderWidth:1.0f];
    [[self.signEMAIL layer] setBorderColor:[UIColor colorWithRed:(164/255.0) green:(164/255.0) blue:(164/255.0) alpha:1].CGColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(IBAction)gSign:(id)sender{
    
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
