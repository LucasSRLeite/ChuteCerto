//
//  AASRootTeamViewController.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/29/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASUser.h"

@interface AASRootTeamViewController : UIViewController <UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) AASUser * user;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarAddValue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarChooseValue;

@property (nonatomic, retain) UIPickerView *pickerViewGolderPlayer;

@property (weak, nonatomic) IBOutlet UITextView *textViewTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelTeamName;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewFlags;

@property (nonatomic) NSMutableArray * arrayTeam;
@property (nonatomic) BOOL isFormFinished;

- (IBAction)toolbarChooseAction:(UIBarButtonItem *)sender;

- (IBAction)toolbarReturnAction:(UIBarButtonItem *)sender;

- (IBAction)toolbarAddRootTeamAction:(UIBarButtonItem *)sender;

- (void) addFlagsInScrollView;
- (void) addTeamInArrayFlag : (UIImage *) flag andCount : (int) i;

- (NSMutableArray *) addGermanyPlayers;
- (NSMutableArray *) addBrasilPlayers;

@end
