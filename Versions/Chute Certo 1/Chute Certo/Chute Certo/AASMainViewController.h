//
//  AASMainViewController.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASMainView.h"
#import "AASMatchesView.h"
#import "AASUser.h"

@interface AASMainViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarMainTitle;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarManageKicksValue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarHomeValue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarRankingValue;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarProfileValue;

@property (nonatomic) AASUser * user;

@property int scoreOne, scoreTwo;
@property unichar group;

@property (nonatomic) BOOL isGame1Detailed;
@property (nonatomic) BOOL isGame2Detailed;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewMain;

@property (nonatomic) AASMainView * mainView;
@property (nonatomic) AASMatchesView * matchesView;

@property (nonatomic) NSString * labelPlacarGame1;

@property (nonatomic) NSInteger indexScrollToView;

- (void) ableScrollViewGestures;
- (void) hideKeyboard;

- (IBAction)toolbarManageKicksAction:(UIBarButtonItem *)sender;
- (IBAction)toolbarHomeAction:(UIBarButtonItem *)sender;
- (IBAction)toolbarRankingAction:(UIBarButtonItem *)sender;
- (IBAction)toolbarProfileAction:(UIBarButtonItem *)sender;

@end
