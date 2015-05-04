//
//  LandingViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "LandingViewController.h"
#import "TutorialViewController.h"
#import "LogInViewController.h"
#import "SignInViewController.h"
<<<<<<< HEAD
#import <Parse/Parse.h>
=======
#import "MTMovintracks.h"
>>>>>>> origin/master
@interface LandingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logIn;
@property (weak, nonatomic) IBOutlet UIButton *signUp;
@property (weak, nonatomic) IBOutlet UIButton *tour;
@property (weak, nonatomic) IBOutlet UILabel *labelPruebas;

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self.tour layer] setBorderWidth:1.0f];
    [[self.tour layer] setBorderColor:[UIColor whiteColor].CGColor];
<<<<<<< HEAD
    PFObject *testObject = [PFObject objectWithClassName:@"Prueba"];
    testObject[@"item1"] = @"bar";
    testObject[@"tienda"] = @"hola";
    [testObject saveInBackground];
=======
    [[NSNotificationCenter defaultCenter] addObserver: self selector:@selector(beaconsListened:) name:kNumberBeaconsNotification object:nil];
>>>>>>> origin/master
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)presentTutorial:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TutorialViewController *vc = (TutorialViewController *)[storyboard instantiateViewControllerWithIdentifier:@"tutorial"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
-(IBAction) logInPressed:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LogInViewController *vc = (LogInViewController *)[storyboard instantiateViewControllerWithIdentifier:@"login"];
    [self presentViewController:vc animated:YES completion:nil];
}
-(IBAction) signUpPressed:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignInViewController *vc = (SignInViewController *)[storyboard instantiateViewControllerWithIdentifier:@"signup"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void) beaconsListened: (NSNotification*) notification{
    if (notification.object && [notification.object isKindOfClass:[NSNumber class]]){
        _labelPruebas.text=[[NSString alloc] initWithFormat:@"Visible beacons: %@", notification.object];
    }
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
