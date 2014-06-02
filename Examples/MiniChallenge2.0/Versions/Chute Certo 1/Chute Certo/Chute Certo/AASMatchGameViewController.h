//
//  AASMatchGameViewController.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASMatchesGroupATableViewCell.h"

@interface AASMatchGameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    UIPickerView *pickerView;
    NSMutableArray *dataArray;
}

@property int scoreOne, scoreTwo;

@property (nonatomic, retain) UIPickerView *pickerViewTeamOne;
@property (nonatomic, retain) UIPickerView *pickerViewTeamTwo;

@property (nonatomic, retain) NSMutableArray *dataArray;
@property (nonatomic) NSString * labelGroupText;
@property (nonatomic) NSString * flagOneImagePath;
@property (nonatomic) NSString * flagTwoImagePath;

- (IBAction)toolbarCancelAction:(UIBarButtonItem *)sender;
- (IBAction)toolbarKickAction:(UIBarButtonItem *)sender;

@end
