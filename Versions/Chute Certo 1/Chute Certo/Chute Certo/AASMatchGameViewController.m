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

    self.labelTeam1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 79, self.view.bounds.size.width/2, 35)];
    self.labelTeam1.text = self.team1;
    [self.labelTeam1 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.labelTeam1];

    self.labelTeam2 = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 79, self.view.bounds.size.width/2, 35)];
    self.labelTeam2.text = self.team2;
    [self.labelTeam2 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.labelTeam2];
    
    CGRect screen = self.view.bounds;
    CGRect fullScreen = screen;
    fullScreen.size.width *= 2.0;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 106, screen.size.width, 128)];
    [self.scrollView setContentSize: CGRectMake(0, 106, fullScreen.size.width, 128).size];
    
    UIImageView * teamFlagOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 161, 128)];
    teamFlagOne.image = [UIImage imageNamed:self.flagOneImagePath];
    [self.scrollView addSubview:teamFlagOne];
    
    UIImageView * teamFlagTwo = [[UIImageView alloc] initWithFrame:CGRectMake(161, 0, 161, 128)];
    teamFlagTwo.image = [UIImage imageNamed:self.flagTwoImagePath];
    [self.scrollView addSubview:teamFlagTwo];
    
    UIImageView * teamFlagThree = [[UIImageView alloc] initWithFrame:CGRectMake(161*2, 0, 161, 128)];
    teamFlagThree.image = [UIImage imageNamed:self.flagThreeImagePath];
    [self.scrollView addSubview:teamFlagThree];
    
    UIImageView * teamFlagFour = [[UIImageView alloc] initWithFrame:CGRectMake(161*3, 0, 161, 128)];
    teamFlagFour.image = [UIImage imageNamed:self.flagFourImagePath];
    [self.scrollView addSubview:teamFlagFour];
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollView];
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

    NSString *path = [NSHomeDirectory() stringByAppendingString:@"/dados.plist"];
    
    NSLog(@"%@", path);

    viewController.scoreOne = self.scoreOne;
    viewController.scoreTwo = self.scoreTwo;
    viewController.group = [self.labelGroupText characterAtIndex:6];
    
    viewController.isGame1Detailed = self.isGame1Detailed;
    viewController.isGame2Detailed = self.isGame2Detailed;
    
    viewController.matchesView.backgroundColor = [UIColor clearColor];
    
    [viewController.scrollViewMain addSubview: viewController.matchesView];
    
    viewController.indexScrollToView = 1;
    
    NSError *error;
    
    self.dataList = [[NSMutableArray alloc]initWithContentsOfFile:path];
    
    if (!self.dataList) {
        NSLog(@"%@", self.labelGroupText);
        self.dataList = [[NSMutableArray alloc]init];
    }
    
    NSMutableDictionary *dados = [[NSMutableDictionary alloc]init];
    
    [dados setObject:[NSString stringWithFormat: @"%d X %d", self.scoreOne, self.scoreTwo] forKey:self.labelGroupText];
    
    [self.dataList addObject:dados];
    [self.dataList writeToFile:path atomically:YES];
    
    NSLog(@"%@", self.dataList);
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

#pragma mark - MyMethods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.contentOffset.x == 0) {
        self.labelTeam1.text = self.team1;
        self.labelTeam2.text = self.team2;
    } else if (self.scrollView.contentOffset.x == self.view.bounds.size.width) {
        self.labelTeam1.text = self.team3;
        self.labelTeam2.text = self.team4;
    }
}

@end
