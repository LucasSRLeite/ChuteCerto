//
//  AASMatchesTableViewCell.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASMatchGameViewController.H"

@interface AASMatchesGroupATableViewCell : UITableViewCell

@property int scoreOne, scoreTwo, scoreThree, scoreFour;

@property (weak, nonatomic) IBOutlet UILabel *labelScoreTeamOne;
@property (weak, nonatomic) IBOutlet UILabel *labelScoreTeamTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelScoreTeamThree;
@property (weak, nonatomic) IBOutlet UILabel *labelScoreTeamFour;

@property (weak, nonatomic) IBOutlet UILabel *labelTeamOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTeamTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelTeamThree;
@property (weak, nonatomic) IBOutlet UILabel *labelTeamFour;

@property (weak, nonatomic) IBOutlet UIImageView *imageFlagOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageFlagTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageFlagThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageFlagFour;

- (IBAction)buttonMatchOneAtion:(UIButton *)sender;
- (IBAction)buttonMatchTwoAction:(UIButton *)sender;

- (void) showGameDetails : (BOOL) isMatchOne;

@end
