//
//  AASMatchsView.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchesView.h"
#import "AASMatchesGroupATableViewCell.h"
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
    self.tableViewMatches = [[UITableView alloc] initWithFrame: rect];
    
    self.tableViewMatches.delegate = self;
    self.tableViewMatches.dataSource = self;
    
    self.arrayMatches = [NSMutableArray arrayWithObjects:@"Clique nas partidas e de seu Chute Certo",
                         @"Brasil x Croacia", @"Camarōes x Mexico", nil];
    
    [self.tableViewMatches registerNib:[UINib nibWithNibName:@"AASMatchesGroupATableViewCell"
                                                     bundle:nil] forCellReuseIdentifier:@"MatchesGroupACell"];
    [self.tableViewMatches setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self addSubview:self.tableViewMatches];
}

#pragma mark - UITableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * simpleTableIdentifier = @"MatchesGroupACell";
    
    AASMatchesGroupATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.labelScoreTeamOne.text = [NSString stringWithFormat: @"%d", self.scoreOne];
    cell.labelScoreTeamOne.hidden = NO;
    NSLog(@"%d", self.scoreTwo);
    
    cell.labelScoreTeamTwo.text = [NSString stringWithFormat: @"%d", self.scoreTwo];
    cell.labelScoreTeamTwo.hidden = NO;
    
    
    switch (indexPath.row) {
        case 1:
            if (cell.isSelected) {
                NSLog(@"Here");

            }
            break;
        case 2 :
            if (cell.selected) {
                
            }
    }
    
    return cell;
}

@end
