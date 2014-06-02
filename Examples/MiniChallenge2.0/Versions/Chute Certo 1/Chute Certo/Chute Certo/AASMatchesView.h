//
//  AASMatchsView.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASMatchesView : UIView <UITableViewDelegate, UITableViewDataSource>

@property int scoreOne, scoreTwo;

@property (nonatomic) IBOutlet UITableView *tableViewMatches;
@property (nonatomic) NSMutableArray * arrayMatches;

@end
