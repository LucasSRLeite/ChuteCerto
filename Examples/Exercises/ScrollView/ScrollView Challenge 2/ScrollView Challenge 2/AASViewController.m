//
//  AASViewController.m
//  ScrollView Challenge 2
//
//  Created by Arthur Augusto Sousa Marques on 5/23/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASViewController.h"
#import "AASResultsView.h"

@interface AASViewController ()

@property (nonatomic) NSInteger randomNumber;
@property (nonatomic) BOOL userWin;
@property (nonatomic) AASResultsView * viewResults;

@end

@implementation AASViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.textFieldNumber.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tapGesture.cancelsTouchesInView = NO;
    
    [self.scrollView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// method to hide keyboard when user taps on a scrollview
-(void)hideKeyboard {
    [self.textFieldNumber resignFirstResponder];
}

- (IBAction)buttonPlay:(UIButton *)sender {
    if ([self isNumberValid]) {
        BOOL userOption = NO;
        if(self.segmentedControlOption.selectedSegmentIndex == 0) {
            userOption = YES;
        }
        
        [self testGame : userOption andResultNumberParity: [self isNumberEven]];
        if(self.viewResults != nil)
            [self.viewResults removeFromSuperview];
        [self showResults];
    }
}

- (BOOL) isNumberValid {
    if ([self.textFieldNumber.text isEqualToString:@""]) {
        self.labelValidation.text = @"Field is empty!";
        return NO;
    }
    if ((self.textFieldNumber.text.integerValue < 0) || (self.textFieldNumber.text.integerValue > 5)) {
        self.labelValidation.text = @"Number is invalid!";
        return NO;
    }
    self.labelValidation.text = @"";
    return YES;
}

- (void) showResults {
    CGRect screenRect = self.view.bounds;
    CGRect biggerRect = screenRect;
    biggerRect.size.width *= 2.0;
    CGRect rectViewResults = CGRectMake(screenRect.size.width, 0, screenRect.size.width, screenRect.size.height);
    self.viewResults = [[AASResultsView alloc] initWithFrame:rectViewResults];
    
    self.viewResults.userAnswer = self.textFieldNumber.text.integerValue;
    self.viewResults.cpuAnswer = self.randomNumber;
    self.viewResults.result = (self.userWin == YES ? @"WIN" : @"LOSE");

    self.viewResults.backgroundColor = [UIColor clearColor];
    [self.scrollView scrollRectToVisible:rectViewResults animated:YES];
    [self.scrollView addSubview:self.viewResults];
    
    self.scrollView.contentSize = biggerRect.size;
    self.scrollView.pagingEnabled = YES;
}

- (void) testGame : (BOOL) userOption andResultNumberParity : (BOOL) result {
    if (result && userOption) {
        self.userWin = NO;
    } else {
        self.userWin = YES;
    }
}

- (BOOL) isNumberEven {
    self.randomNumber = arc4random() % 6;
    if ((self.textFieldNumber.text.integerValue + self.randomNumber) % 2 == 0) {
        return YES;
    }
    return NO;
}

@end
