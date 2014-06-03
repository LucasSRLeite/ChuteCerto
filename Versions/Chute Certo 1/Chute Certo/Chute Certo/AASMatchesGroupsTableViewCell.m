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

- (void) showGameDetails : (BOOL) isMatchOne {
    AASMatchGameViewController * viewController = [[AASMatchGameViewController alloc] init];
    viewController.labelGroupText = self.labelGroup;
    viewController.flagOneImagePath = self.flagOneImagePath;
    viewController.flagTwoImagePath = self.flagTwoImagePath;
    viewController.flagThreeImagePath = self.flagThreeImagePath;
    viewController.flagFourImagePath = self.flagFourImagePath;
    viewController.team1 = [self.segmentedControlGame1 titleForSegmentAtIndex:0];
    viewController.team2 = [self.segmentedControlGame1 titleForSegmentAtIndex:2];
    viewController.team3 = [self.segmentedControlGame2 titleForSegmentAtIndex:0];
    viewController.team4 = [self.segmentedControlGame2 titleForSegmentAtIndex:2];
    
    if (isMatchOne) {
        self.isGame1Detailed = YES;
        viewController.isGame1Detailed = self.isGame1Detailed;
    } else {
        self.isGame2Detailed = YES;
        viewController.isGame2Detailed = self.isGame2Detailed;
    }
    
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:viewController];
}

@end
