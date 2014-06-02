//
//  AASResultsView.h
//  ScrollView Challenge 2
//
//  Created by Arthur Augusto Sousa Marques on 5/23/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASResultsView : UIView

@property (nonatomic) NSInteger userAnswer;
@property (nonatomic) NSInteger cpuAnswer;
@property (nonatomic) NSString * result;

- (UILabel *) createLabelPosition : (CGRect) rect;

@end
