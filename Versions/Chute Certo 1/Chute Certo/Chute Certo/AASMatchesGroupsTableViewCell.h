//
//  AASMatchesTableViewCell.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASMatchesGroupsTableViewCell : UITableViewCell

@property int scoreOne, scoreTwo, scoreThree, scoreFour;
@property NSString * labelGroup;
@property NSString * flagOneImagePath;
@property NSString * flagTwoImagePath;
@property NSString * flagThreeImagePath;
@property NSString * flagFourImagePath;

@property (weak, nonatomic) IBOutlet UILabel *labelDataGame1;
@property (weak, nonatomic) IBOutlet UILabel *labelDataGame2;

@property (nonatomic) BOOL isGame1Detailed;
@property (nonatomic) BOOL isGame2Detailed;

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

@property (weak, nonatomic) IBOutlet UIView *viewScore1;
@property (weak, nonatomic) IBOutlet UIView *viewScore2;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlGame1;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlGame2;



- (IBAction)segmentedControlGame1Action:(UISegmentedControl *)sender;
- (IBAction)segmentedControlGame2Action:(UISegmentedControl *)sender;

- (IBAction)buttonMatchOneAtion:(UIButton *)sender;
- (IBAction)buttonMatchTwoAction:(UIButton *)sender;

- (void) showGameDetails : (BOOL) isMatchOne;

@end
