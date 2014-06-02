//
//  AASMainView.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMainView.h"

@implementation AASMainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    UIImageView * imageLogo = [[UIImageView alloc] initWithFrame:CGRectMake(rect.size.width/2-100, rect.size.height/2-106, 200, 213)];
    imageLogo.image = [UIImage imageNamed:@"bicycle kick"];
    
    [self addSubview:imageLogo];
}

@end
