//
//  AASMainViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMainViewController.h"
#import "AASMainView.h"
#import "AASMatchesView.h"
#import "AASMatchGameViewController.h"

@interface AASMainViewController ()

@end

@implementation AASMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self ableScrollViewGestures];
    
    CGRect screen = self.view.bounds;
    CGRect fullScreen = screen;
    fullScreen.size.width *= 3.0;
    
    [self.scrollViewMain setContentSize: fullScreen.size];
    
    CGRect firstScreen = CGRectMake(screen.size.width, 0, screen.size.width, screen.size.height);
    self.mainView = [[AASMainView alloc] initWithFrame:firstScreen];
    self.mainView.backgroundColor = [UIColor clearColor];
    
    [self.scrollViewMain addSubview: self.mainView];
    
    CGRect matchesScreen = CGRectMake(0, 0, screen.size.width, screen.size.height);
    self.matchesView = [[AASMatchesView alloc] initWithFrame:matchesScreen];
    self.matchesView.backgroundColor = [UIColor clearColor];
    self.matchesView.scoreOne = self.scoreOne;
    self.matchesView.scoreTwo = self.scoreTwo;
    
    [self.scrollViewMain addSubview: self.matchesView];
    
    [self.scrollViewMain scrollRectToVisible:firstScreen animated:NO];
    
    self.scrollViewMain.pagingEnabled = YES;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) ableScrollViewGestures {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tapGesture.cancelsTouchesInView = NO;
    
    [self.scrollViewMain addGestureRecognizer:tapGesture];
}

-(void) hideKeyboard {
//    [self.matchesView.textField resignFirstResponder];
}

@end
