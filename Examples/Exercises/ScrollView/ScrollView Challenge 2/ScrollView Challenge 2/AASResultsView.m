//
//  AASResultsView.m
//  ScrollView Challenge 2
//
//  Created by Arthur Augusto Sousa Marques on 5/23/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASResultsView.h"

@implementation AASResultsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    int margin = 70;
    
    UILabel * labelUser = [self createLabelPosition : CGRectMake(rect.size.width/2-25, 10, 50, 50)];
    labelUser.text = @"YOU";
    [self addSubview:labelUser];
    
    UIImageView * imageUserAnswer = [[UIImageView alloc] initWithFrame:CGRectMake(rect.size.width/2-25, margin, 50, 50)];
    imageUserAnswer.image = [UIImage imageNamed: [NSString stringWithFormat:@"%ddedos.png", self.userAnswer]];
    imageUserAnswer.transform = CGAffineTransformMakeRotation(M_PI_2*2);
    [self addSubview:imageUserAnswer];

    UILabel * labelResults = [self createLabelPosition : CGRectMake(rect.size.width/2-25, rect.size.height/2-50, 100, 100)];
    labelResults.text = self.result;
    if ([self.result isEqualToString:@"WIN"]) {
        labelResults.textColor = [UIColor greenColor];
    } else {
        labelResults.textColor = [UIColor redColor];
    }
    
    [labelResults setFont:[UIFont systemFontOfSize:30]];
    [self addSubview:labelResults];
    UIImageView * imageCpuAnswer = [[UIImageView alloc] initWithFrame:CGRectMake(rect.size.width/2-25, rect.size.height-margin, 50, 50)];
    imageCpuAnswer.image = [UIImage imageNamed: [NSString stringWithFormat:@"%ddedos.png", self.cpuAnswer]];
    [self addSubview:imageCpuAnswer];
    
    UILabel * labelCpu = [self createLabelPosition : CGRectMake(rect.size.width/2-25, rect.size.height-(margin*2), 50, 50)];
    labelCpu.text = @"CPU";
    [self addSubview:labelCpu];
}

- (UILabel *) createLabelPosition : (CGRect) rect {
    UILabel * label = [[UILabel alloc] initWithFrame: rect];
    label.textColor = [UIColor blackColor];
    return label;
}

@end
