//
//  AASMatchGameViewController.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASMatchGameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate>

@property int scoreOne, scoreTwo;

@property (nonatomic) NSMutableArray * dataList;

@property (nonatomic) BOOL isGame1Detailed;
@property (nonatomic) BOOL isGame2Detailed;

@property (nonatomic) UILabel * labelTeam1;
@property (nonatomic) UILabel * labelTeam2;

@property (nonatomic, retain) UIPickerView *pickerViewTeamOne;
@property (nonatomic, retain) UIPickerView *pickerViewTeamTwo;

@property (nonatomic, retain) NSMutableArray *dataArray;

@property (nonatomic) NSString * labelGroupText;
@property (nonatomic) NSString * team1;
@property (nonatomic) NSString * team2;
@property (nonatomic) NSString * team3;
@property (nonatomic) NSString * team4;

@property (nonatomic) UIScrollView * scrollView;

@property (nonatomic) NSString * flagOneImagePath;
@property (nonatomic) NSString * flagTwoImagePath;
@property (nonatomic) NSString * flagThreeImagePath;
@property (nonatomic) NSString * flagFourImagePath;

- (IBAction)toolbarCancelAction:(UIBarButtonItem *)sender;
- (IBAction)toolbarKickAction:(UIBarButtonItem *)sender;

- (UIPickerView *) createPickerView : (UIPickerView *) pickerView andRect : (CGRect) rect;

@end
