//
//  AASViewController.m
//  ScrollView Challenge 1
//
//  Created by Arthur Augusto Sousa Marques on 5/23/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASViewController.h"

@interface AASViewController ()

@end

@implementation AASViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.arrayImages = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = self.view.bounds;
    CGRect biggerRect = screenRect;
    
    for (int i = 0; i < 16; i++) {
        UIImageView * image = [[UIImageView alloc] initWithFrame: CGRectMake(screenRect.size.width*i+10, 10, 300, screenRect.size.width)];
        NSString * strImage = [NSString stringWithFormat:@"IMG_00%d.png",i+20];
        image.image = [UIImage imageNamed:strImage];
        image.transform = CGAffineTransformMakeRotation(M_PI_2);
        [self.arrayImages addObject: image];
        
        biggerRect.size.width *= 2.0;
        [self.scrollViewImages addSubview:[self.arrayImages objectAtIndex:i]];
    }
    
    self.scrollViewImages.contentSize = biggerRect.size;
    
    self.scrollViewImages.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
