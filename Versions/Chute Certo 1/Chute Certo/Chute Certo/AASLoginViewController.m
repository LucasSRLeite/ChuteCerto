//
//  AASFacebookLoginViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASLoginViewController.h"
#import "AASRegisterViewController.h"

@interface AASLoginViewController ()

@end

@implementation AASLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        // Comentario do Samuel
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonLogar:(UIButton *)sender {
}

- (IBAction)buttonRegister:(UIButton *)sender {
    AASRegisterViewController * viewController = [[AASRegisterViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}
@end
