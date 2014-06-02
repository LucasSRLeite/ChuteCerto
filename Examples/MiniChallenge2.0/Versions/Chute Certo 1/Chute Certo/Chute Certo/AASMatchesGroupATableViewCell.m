//
//  AASMatchesTableViewCell.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMatchesGroupATableViewCell.h"
#import "AASMatchGameViewController.h"
#import "AASMatchesView.h"

@interface AASMatchesGroupATableViewCell ()

@property (nonatomic) AASMatchGameViewController * viewController;

@end

@implementation AASMatchesGroupATableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"oi");
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonMatchOneAtion:(UIButton *)sender {
    [self showGameDetails : YES];
}

- (IBAction)buttonMatchTwoAction:(UIButton *)sender {
    [self showGameDetails : NO];
}

- (void) showGameDetails : (BOOL) isMatchOne {
    self.viewController = [[AASMatchGameViewController alloc] init];
    self.viewController.labelGroupText = @"Grupo A";
    if (isMatchOne) {
        _viewController.flagOneImagePath = @"Brazil Flag Original";
        _viewController.flagTwoImagePath = @"Croatia Flag Original";
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:_viewController];
    } else {
        NSLog(@"oakoakoak");
        _viewController.flagOneImagePath = @"Mexico Flag Original";
        _viewController.flagTwoImagePath = @"Camaroes Flag Original";
        [[[[UIApplication sharedApplication] delegate] window] setRootViewController:_viewController];
    }
}


@end
