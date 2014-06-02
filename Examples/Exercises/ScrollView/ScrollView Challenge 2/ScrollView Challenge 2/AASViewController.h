//
//  AASViewController.h
//  ScrollView Challenge 2
//
//  Created by Arthur Augusto Sousa Marques on 5/23/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldNumber;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlOption;
@property (weak, nonatomic) IBOutlet UILabel *labelValidation;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)buttonPlay:(UIButton *)sender;

- (BOOL) isNumberEven;
- (void) testGame : (BOOL) userOption andResultNumberParity : (BOOL) result;
- (void) showResults;
- (BOOL) isNumberValid;

@end
