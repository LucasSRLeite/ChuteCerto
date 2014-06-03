//
//  AASMatchsView.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASMatchesGroupsTableViewCell.h"

@interface AASMatchesView : UIView <UITableViewDelegate, UITableViewDataSource>

@property int scoreOne, scoreTwo;
@property char group;

@property (nonatomic) BOOL isGame1Detailed;
@property (nonatomic) BOOL isGame2Detailed;

@property (nonatomic) IBOutlet UITableView *tableViewMatches;
@property (nonatomic) NSMutableArray * arrayMatches;

@property (nonatomic) NSString * labelPlacarGame1;

- (AASMatchesGroupsTableViewCell *) callGroupsTableViewCell : (UITableView *) tableView andSimpleTableIdentifier : (NSString *) simpleTableIdentifier andIndexRow : (NSInteger) row andFlags : (NSMutableArray *) flags andIdentifier: (NSArray *) identifiers andLabelGroup : (NSString *) labelGroup andFlagsGamePath : (NSMutableArray *) flagsGamePath andDates: (NSArray *) gameDate;

@end
