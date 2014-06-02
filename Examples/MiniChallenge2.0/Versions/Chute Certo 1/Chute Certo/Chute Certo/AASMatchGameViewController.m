//
//  AASMatchGameViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchGameViewController.h"
#import "AASMainViewController.h"
#import "AASMatchesGroupATableViewCell.h"

@interface AASMatchGameViewController ()

@property (nonatomic) AASMatchesGroupATableViewCell * matches;
@property (nonatomic) UITextField *txtFieldTeamOne;
@property (nonatomic) UITextField *txtFieldTeamTwo;

@end

@implementation AASMatchGameViewController

@synthesize pickerViewTeamOne;
@synthesize pickerViewTeamTwo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scoreOne = 2;
    self.scoreTwo = 2;
    
    pickerViewTeamOne = [[UIPickerView alloc] init];
    
    [pickerViewTeamOne setDataSource: self];
    [pickerViewTeamOne setDelegate: self];
    
    [pickerViewTeamOne setFrame: CGRectMake(50, 240, 50, 162.0)];
    
    pickerViewTeamOne.showsSelectionIndicator = YES;
    
    [pickerViewTeamOne selectRow:2 inComponent:0 animated:YES];
    
    [self.view addSubview: pickerViewTeamOne];
    
    UILabel *labelVs = [[UILabel alloc]initWithFrame:CGRectMake(140, 250, 50, 150)];
    labelVs.text = @"X";
    labelVs.font = [UIFont fontWithName:@"Helvetica" size:60];
    [self.view addSubview: labelVs];
    
    
    pickerViewTeamTwo = [[UIPickerView alloc] init];
    
    [pickerViewTeamTwo setDataSource: self];
    [pickerViewTeamTwo setDelegate: self];
    
    [pickerViewTeamTwo setFrame: CGRectMake(220, 240, 50, 162.0)];
    
    pickerViewTeamTwo.showsSelectionIndicator = YES;
    
    [pickerViewTeamTwo selectRow:2 inComponent:0 animated:YES];
    
    [self.view addSubview: pickerViewTeamTwo];
    
    UILabel * labelGroup = [[UILabel alloc] initWithFrame:CGRectMake(107, 52, 106, 35)];
    labelGroup.text = self.labelGroupText;
    [self.view addSubview:labelGroup];
    
    UIImageView * teamFlagOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 106, 161, 128)];
    teamFlagOne.image = [UIImage imageNamed:self.flagOneImagePath];
    [self.view addSubview:teamFlagOne];
    
    UIImageView * teamFlagTwo = [[UIImageView alloc] initWithFrame:CGRectMake(161, 106, 161, 128)];
    teamFlagTwo.image = [UIImage imageNamed:self.flagTwoImagePath];
    [self.view addSubview:teamFlagTwo];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 100;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = [NSString stringWithFormat:@"%d", row];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == pickerViewTeamOne) {
        self.scoreOne = row;
    }else{
        self.scoreTwo = row;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)toolbarCancelAction:(UIBarButtonItem *)sender {
    AASMainViewController * viewController = [[AASMainViewController alloc] init];
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
    
    CGRect matchesScreen = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [viewController.scrollViewMain scrollRectToVisible:matchesScreen animated:NO];
}

- (IBAction)toolbarKickAction:(UIBarButtonItem *)sender {
    //Adicionar valores informados na tabela
    AASMainViewController * viewController = [[AASMainViewController alloc] init];
    
    viewController.scoreOne = self.scoreOne;
    viewController.scoreTwo = self.scoreTwo;
    
    CGRect matchesScreen = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    viewController.matchesView.backgroundColor = [UIColor clearColor];
    
    [viewController.scrollViewMain addSubview: viewController.matchesView];
    
    [viewController.scrollViewMain scrollRectToVisible:matchesScreen animated:NO];
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}
@end
