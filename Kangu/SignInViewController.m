//
//  SignInViewController.m
//  Kangu
//
//  Created by Heinz Sohm on 1/5/15.
//  Copyright (c) 2015 Proximity2U. All rights reserved.
//

#import "SignInViewController.h"

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
