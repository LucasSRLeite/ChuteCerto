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

@interface AASMainViewController : UIViewController

@property int scoreOne, scoreTwo;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewMain;

@property (nonatomic) AASMainView * mainView;
@property (nonatomic) AASMatchesView * matchesView;

- (void) ableScrollViewGestures;
- (void) hideKeyboard;

@end
