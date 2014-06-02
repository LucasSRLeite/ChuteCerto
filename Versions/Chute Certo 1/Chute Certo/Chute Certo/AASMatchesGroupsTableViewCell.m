//
//  AASMatchesTableViewCell.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchesGroupsTableViewCell.h"
#import "AASMatchGameViewController.h"

@implementation AASMatchesGroupsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    //Comentario teste
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)segmentedControlGame1Action:(UISegmentedControl *)sender {
    
}

- (IBAction)segmentedControlGame2Action:(UISegmentedControl *)sender {
    
}

- (IBAction)buttonMatchOneAtion:(UIButton *)sender {
    [self showGameDetails : YES];
}

- (IBAction)buttonMatchTwoAction:(UIButton *)sender {
    [self showGameDetails : NO];
}

- (void) showGameDetails : (BOOL) isMatchOne {
    AASMatchGameViewController * viewController = [[AASMatchGameViewController alloc] init];
    viewController.labelGroupText = self.labelGroup;
    if (isMatchOne) {
        viewController.flagOneImagePath = self.flagOneImagePath;
        viewController.flagTwoImagePath = self.flagTwoImagePath;
        self.isGame1Detailed = YES;
        viewController.isGame1Detailed = self.isGame1Detailed;
    } else {
        viewController.flagOneImagePath = self.flagThreeImagePath;
        viewController.flagTwoImagePath = self.flagFourImagePath;
        self.isGame2Detailed = YES;
        viewController.isGame2Detailed = self.isGame2Detailed;
    }
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

@end
