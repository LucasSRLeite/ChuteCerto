//
//  AASMatchsView.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchesView.h"
#import "AASMatchesGroupsTableViewCell.h"
#import "AASMatchGameViewController.h"

@implementation AASMatchesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    
    self.tableViewMatches = [[UITableView alloc] initWithFrame: CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    
    self.tableViewMatches.backgroundColor = [UIColor clearColor];
    
    self.tableViewMatches.delegate = self;
    self.tableViewMatches.dataSource = self;
    
    self.arrayMatches = [NSMutableArray arrayWithObjects:@"Clique nas partidas e de seu Chute Certo",
                         @"Brasil x Croacia", @"Camarōes x Mexico", nil];
    
    [self.tableViewMatches registerNib:[UINib nibWithNibName:@"AASMatchesGroupsTableViewCell"
                                                     bundle:nil] forCellReuseIdentifier:@"MatchesGroupsCell"];
    
    [self.tableViewMatches setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    
    [self addSubview:self.tableViewMatches];
}

#pragma mark - UITableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AASMatchesGroupsTableViewCell * tableViewCell = [[AASMatchesGroupsTableViewCell alloc] init];
    
    UILabel *labelGroup;
    NSArray *identifiers;
    NSArray *dates;
    
    switch (indexPath.row) {
        case 0:
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo A";
            
            identifiers = [[NSArray alloc]initWithObjects:@"BRA", @"CRO", @"MEX", @"CAM",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Brasil Flag", @"Croacia Flag", @"Mexico Flag", @"Camaroes Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo A" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Brazil Flag Original", @"Croatia Flag Original", @"Mexico Flag Original", @"Camaroes Flag Original", nil] andDates: dates];
            break;
        case 1 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo B";
            
            identifiers = [[NSArray alloc]initWithObjects:@"ESP", @"HOL", @"AUS", @"CHI",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Espanha Flag", @"Holanda Flag", @"Australia Flag", @"Chile Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo B" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Espanha Flag Original", @"Holanda Flag Original", @"Australia Flag Original", @"Chile Flag Original", nil] andDates: dates];
            break;
        case 2 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*2, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo C";
            
            identifiers = [[NSArray alloc]initWithObjects:@"COL", @"GRE", @"CMA", @"JAP",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Colombia Flag", @"Grecia Flag", @"Costa do Marfim Flag", @"Japao Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo C" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Colombia Flag Original", @"Grecia Flag Original", @"Costa do Marfim Flag Original", @"Japao Flag Original", nil] andDates: dates];
            break;
        case 3 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*3, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo D";
            
            identifiers = [[NSArray alloc]initWithObjects:@"URU", @"CRI", @"ING", @"ITA",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Uruguai Flag", @"Costa Rica Flag", @"Inglaterra Flag", @"Italia Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo D" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Uruguai Flag Original", @"Costa Rica Flag Original", @"Inglaterra Flag Original", @"Italia Flag Original", nil] andDates: dates];
            break;
        case 4 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*4, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo E";
            
            identifiers = [[NSArray alloc]initWithObjects:@"SUI", @"EQU", @"FRA", @"HON",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Suica Flag", @"Equador Flag", @"Franca Flag", @"Honduras Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo E" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Suica Flag Original", @"Equador Flag Original", @"Franca Flag Original", @"Honduras Flag Original", nil] andDates: dates];
            break;
        case 5 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*5, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo F";
            
            identifiers = [[NSArray alloc]initWithObjects:@"ARG", @"BOS", @"NIG", @"IRA",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Argentina Flag", @"Bosnia Flag", @"Nigeria Flag", @"Iran Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo F" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Argentina Flag Original", @"Bosnia Flag Original", @"Nigeria Flag Original", @"Iran Flag Original", nil] andDates: dates];
            break;
        case 6 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*6, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo G";
            
            identifiers = [[NSArray alloc]initWithObjects:@"ALE", @"POR", @"GAN", @"EUA",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Alemanha Flag", @"Portugal Flag", @"Gana Flag", @"Estados Unidos Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo G" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Alemanha Flag Original", @"Portugal Flag Original", @"Gana Flag Original", @"Estados Unidos Flag Original", nil] andDates: dates];
            break;
        case 7 :
            labelGroup = [[UILabel alloc]initWithFrame:CGRectMake(0, 180*7, self.window.bounds.size.width, 35)];
            labelGroup.text = @"Grupo H";
            
            identifiers = [[NSArray alloc]initWithObjects:@"BEL", @"ARG", @"RUS", @"CSU",  nil];
            dates = [[NSArray alloc]initWithObjects:@"00/00", @"01/00", nil];
            
            tableViewCell = [self callGroupsTableViewCell:tableView andSimpleTableIdentifier:@"MatchesGroupsCell" andIndexRow : indexPath.row andFlags:[[NSMutableArray alloc] initWithObjects:@"Belgica Flag", @"Argelia Flag", @"Russia Flag", @"Coreia do Sul Flag", nil] andIdentifier:identifiers andLabelGroup:@"Grupo H" andFlagsGamePath: [[NSMutableArray alloc] initWithObjects:@"Belgica Flag Original", @"Argelia Flag Original", @"Russia Flag Original", @"Coreia do Sul Flag Original", nil] andDates: dates];
    }
    //    labelGroup.backgroundColor = [UIColor colorWithRed:0 green:0.501961 blue:0.25098 alpha:1];
    labelGroup.font = [UIFont fontWithName:@"Helvetica" size:30];
    labelGroup.textColor = [UIColor grayColor];
    labelGroup.textAlignment = NSTextAlignmentCenter;
    tableViewCell.backgroundColor = [UIColor clearColor];
    [tableView addSubview:labelGroup];
    return tableViewCell;
}

- (AASMatchesGroupsTableViewCell *) callGroupsTableViewCell : (UITableView *) tableView andSimpleTableIdentifier : (NSString *) simpleTableIdentifier andIndexRow : (NSInteger) row andFlags : (NSMutableArray *) flags andIdentifier: (NSArray *) identifiers andLabelGroup : (NSString *) labelGroup andFlagsGamePath : (NSMutableArray *) flagsGamePath andDates: (NSArray *) gameDate{
    AASMatchesGroupsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (!self.isGame1Detailed) {
        cell.segmentedControlGame1.hidden = NO;
        cell.viewScore1.hidden = YES;
    } else {
        cell.isGame1Detailed = self.isGame1Detailed;
        cell.scoreOne = self.scoreOne;
        cell.labelScoreTeamOne.text = [NSString stringWithFormat: @"%d", self.scoreOne];
        cell.labelScoreTeamOne.hidden = NO;
        
        cell.scoreTwo = self.scoreTwo;
        cell.labelScoreTeamTwo.text = [NSString stringWithFormat: @"%d", self.scoreTwo];
        cell.labelScoreTeamTwo.hidden = NO;
        
        cell.viewScore1.hidden = NO;
        cell.segmentedControlGame1.hidden = YES;
    }
    if (!self.isGame2Detailed) {
        cell.segmentedControlGame2.hidden = NO;
        cell.viewScore2.hidden = YES;
    } else {
        cell.isGame2Detailed = self.isGame2Detailed;
        cell.scoreThree = self.scoreOne;
        cell.labelScoreTeamThree.text = [NSString stringWithFormat: @"%d", self.scoreOne];
        cell.labelScoreTeamFour.hidden = NO;
        
        cell.scoreFour = self.scoreTwo;
        cell.labelScoreTeamFour.text = [NSString stringWithFormat: @"%d", self.scoreTwo];
        cell.labelScoreTeamFour.hidden = NO;
        
        cell.viewScore2.hidden = NO;
        cell.segmentedControlGame2.hidden = YES;
    }
    
    cell.imageFlagOne.image = [UIImage imageNamed:flags[0]];
    cell.imageFlagTwo.image = [UIImage imageNamed:flags[1]];
    cell.imageFlagThree.image = [UIImage imageNamed:flags[2]];
    cell.imageFlagFour.image = [UIImage imageNamed:flags[3]];
    
    cell.flagOneImagePath = flagsGamePath[0];
    cell.flagTwoImagePath = flagsGamePath[1];
    cell.flagThreeImagePath = flagsGamePath[2];
    cell.flagFourImagePath = flagsGamePath[3];
    
    //cell.labelDataGame1.text = [gameDate objectAtIndex:0];
    //cell.labelDataGame2.text = [gameDate objectAtIndex:1];
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:14];
    
    cell.labelTeamOne.text = [identifiers objectAtIndex:0];
    cell.labelTeamOne.font = font;
    cell.labelTeamTwo.text = [identifiers objectAtIndex:1];
    cell.labelTeamTwo.font = font;
    cell.labelTeamThree.text = [identifiers objectAtIndex:2];
    cell.labelTeamFour.font = font;
    cell.labelTeamFour.text = [identifiers objectAtIndex:3];
    cell.labelTeamFour.font = font;
    
    if (row%2 == 0) {
        cell.backgroundColor = [UIColor grayColor];
    }
    
    [cell.segmentedControlGame1 setTitle:[identifiers objectAtIndex:0] forSegmentAtIndex:0];
    [cell.segmentedControlGame1 setTitle:[identifiers objectAtIndex:1] forSegmentAtIndex:2];
    
    [cell.segmentedControlGame2 setTitle:[identifiers objectAtIndex:2] forSegmentAtIndex:0];
    [cell.segmentedControlGame2 setTitle:[identifiers objectAtIndex:3] forSegmentAtIndex:2];
    
    cell.labelGroup = labelGroup;

    if (cell.isSelected) {
        NSLog(@"Here");
        
    }
    return cell;
}

@end
