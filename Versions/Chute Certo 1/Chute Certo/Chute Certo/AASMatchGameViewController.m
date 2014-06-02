//
//  AASMatchGameViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchGameViewController.h"
#import "AASMainViewController.h"
#import "AASMatchesGroupsTableViewCell.h"

@interface AASMatchGameViewController ()

@property (nonatomic) AASMatchesGroupsTableViewCell * matches;
@property (nonatomic) UITextField *txtFieldTeamOne;
@property (nonatomic) UITextField *txtFieldTeamTwo;

@end

@implementation AASMatchGameViewController

#pragma mark - ViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scoreOne = 0;
    self.scoreTwo = 0;
    
    self.pickerViewTeamOne = [self createPickerView : self.pickerViewTeamOne
                                            andRect : CGRectMake(50, 240, 50, 162.0)];
    
    [self.view addSubview: self.pickerViewTeamOne];
    
    UILabel *labelVs = [[UILabel alloc]initWithFrame:CGRectMake(140, 250, 50, 150)];
    labelVs.text = @"X";
    labelVs.font = [UIFont fontWithName:@"Helvetica" size:60];
    [self.view addSubview: labelVs];
    
    self.pickerViewTeamTwo = [self createPickerView : self.pickerViewTeamTwo
                                             andRect:CGRectMake(220, 240, 50, 162.0)];
    
    [self.view addSubview: self.pickerViewTeamTwo];
    
    UILabel * labelGroup = [[UILabel alloc] initWithFrame:CGRectMake(0, 52, self.view.bounds.size.width, 35)];
    labelGroup.text = self.labelGroupText;
    [labelGroup setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelGroup];
    
    UIImageView * teamFlagOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 106, 161, 128)];
    teamFlagOne.image = [UIImage imageNamed:self.flagOneImagePath];
    [self.view addSubview:teamFlagOne];
    
    UIImageView * teamFlagTwo = [[UIImageView alloc] initWithFrame:CGRectMake(161, 106, 161, 128)];
    teamFlagTwo.image = [UIImage imageNamed:self.flagTwoImagePath];
    [self.view addSubview:teamFlagTwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - PickerView Methods

- (UIPickerView *) createPickerView : (UIPickerView *) pickerView andRect : (CGRect) rect {
    pickerView = [[UIPickerView alloc] init];
    
    [pickerView setDataSource: self];
    [pickerView setDelegate: self];
    
    [pickerView setFrame: rect];
    
    pickerView.showsSelectionIndicator = YES;
    
    [pickerView selectRow:0 inComponent:0 animated:YES];

    return pickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 20;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = [NSString stringWithFormat:@"%d", row];
    return title;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.pickerViewTeamOne) {
        self.scoreOne = (int) row;
    }else{
        self.scoreTwo = (int) row;
    }
}

#pragma mark - Toolbar Methods

- (IBAction)toolbarCancelAction:(UIBarButtonItem *)sender {
    AASMainViewController * viewController = [[AASMainViewController alloc] init];

    viewController.indexScrollToView = 1;
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

- (IBAction)toolbarKickAction:(UIBarButtonItem *)sender {
    AASMainViewController * viewController = [[AASMainViewController alloc] init];
    
    viewController.scoreOne = self.scoreOne;
    viewController.scoreTwo = self.scoreTwo;
    viewController.group = [self.labelGroupText characterAtIndex:6];
    
    viewController.isGame1Detailed = self.isGame1Detailed;
    viewController.isGame2Detailed = self.isGame2Detailed;
    
    viewController.matchesView.backgroundColor = [UIColor clearColor];
    
    [viewController.scrollViewMain addSubview: viewController.matchesView];
    
    viewController.indexScrollToView = 1;
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

@end
