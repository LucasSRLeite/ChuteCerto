//
//  AASMainViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASMainViewController.h"
#import "AASMainView.h"
#import "AASMatchesView.h"
#import "AASMatchGameViewController.h"
#import "AASRegisterViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface AASMainViewController ()

@end

@implementation AASMainViewController

#pragma mark - ViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self ableScrollViewGestures];
    
    self.viewMenu.hidden = YES;
    self.tableViewMenu.backgroundColor = [UIColor clearColor];
    self.arrayTableViewMenuData = [NSMutableArray arrayWithObjects:@"Configuraçōes", @"Perfil",
                               @"Meus Chutes", @"Ranking", @"Tutorial", nil];
    
    self.scrollViewMain.delegate = self;
    
    if (self.user == nil) {
        self.user = [[AASUser alloc] init];
    }
    
    CGRect screen = self.view.bounds;
    CGRect fullScreen = screen;
    fullScreen.size.width *= 4.0;
    
    [self.scrollViewMain setContentSize: CGRectMake(0, 0, fullScreen.size.width, fullScreen.size.height-88).size];
    
    CGRect firstScreen = CGRectMake(screen.size.width, 0, screen.size.width, screen.size.height);
    self.mainView = [[AASMainView alloc] initWithFrame:firstScreen];
    self.mainView.backgroundColor = [UIColor clearColor];
    
    [self.scrollViewMain addSubview: self.mainView];
    
    CGRect matchesScreen = CGRectMake(0, 0, screen.size.width, screen.size.height-88);
    self.matchesView = [[AASMatchesView alloc] initWithFrame:matchesScreen];
    self.matchesView.backgroundColor = [UIColor clearColor];
    self.matchesView.isGame1Detailed = self.isGame1Detailed;
    self.matchesView.isGame2Detailed = self.isGame2Detailed;
    
    self.matchesView.scoreOne = self.scoreOne;
    self.matchesView.scoreTwo = self.scoreTwo;
    self.matchesView.group = self.group;

    [self.scrollViewMain addSubview: self.matchesView];
    
    if (self.indexScrollToView == 1) {
        [self.scrollViewMain scrollRectToVisible:CGRectMake(0, 0, screen.size.width, screen.size.height-88) animated:YES];
        self.indexScrollToView = 2;
    } else {
        [self.scrollViewMain scrollRectToVisible:firstScreen animated:NO];
    }
    
    self.scrollViewMain.pagingEnabled = YES;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    if (self.user.name != nil) {
        UILabel * labelName = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width, 50)];
        labelName.text = [NSString stringWithFormat:@"Apelido: %@", self.user.name];
        [self.mainView addSubview:labelName];
        UILabel * labelTeam = [[UILabel alloc] initWithFrame:CGRectMake(100, 160, self.view.bounds.size.width, 50)];
        labelTeam.text = [NSString stringWithFormat:@"Seleção: %@", self.user.team.name];
        [self.mainView addSubview:labelTeam];
    }
}

#pragma mark - ScrollView Methods

- (void) ableScrollViewGestures {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tapGesture.cancelsTouchesInView = NO;
    
    [self.scrollViewMain addGestureRecognizer:tapGesture];
}

-(void) hideKeyboard {
//    [self.matchesView.textField resignFirstResponder];
}

#pragma mark - Toolbar Methods

- (IBAction)toolbarManageKicksAction:(UIBarButtonItem *)sender {
    CGRect matchesScreen = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-88);
    [self.scrollViewMain scrollRectToVisible:matchesScreen animated:YES];
}

- (IBAction)toolbarHomeAction:(UIBarButtonItem *)sender {
    CGRect firstScreen = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
    [self.scrollViewMain scrollRectToVisible:firstScreen animated:YES];
}

- (IBAction)toolbarRankingAction:(UIBarButtonItem *)sender {
    CGRect firstScreen = CGRectMake(self.view.bounds.size.width*2, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.scrollViewMain scrollRectToVisible:firstScreen animated:YES];

}

- (IBAction)toolbarProfileAction:(UIBarButtonItem *)sender {
    AASRegisterViewController * viewController = [[AASRegisterViewController alloc] init];
    
    [self presentViewController:viewController animated:YES completion: ^{
        self.user = viewController.user;
    }];
}

#pragma mark - TableView Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayTableViewMenuData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [self.arrayTableViewMenuData objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    switch (indexPath.row) {
        case 0:
            /* cell.imageView.image = [UIImage imageNamed:@"Sum Operation Icon.png"];
            if (cell.selected) {
                self.labelMathOperationQuestion.text = @"SUM";
                self.mathOperation = 0;
            }
            break;*/
        case 1 :
            break;
        case 2 :
            break;
    }
    
    return cell;
}



#pragma mark - MyMethods

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollViewMain.contentOffset.x == 0) {
        self.toolbarMainTitle.title = @"Chute os placares";
        [self manageToolbarSelectedColor : 1];
    } else if (self.scrollViewMain.contentOffset.x == self.view.bounds.size.width) {
        self.toolbarMainTitle.title = @"Chute Certo";
        [self manageToolbarSelectedColor : 2];
    } else if (self.scrollViewMain.contentOffset.x == self.view.bounds.size.width*2) {
        self.toolbarMainTitle.title = @"Ranking";
        [self manageToolbarSelectedColor : 3];
    } else if (self.scrollViewMain.contentOffset.x == self.view.bounds.size.width*3) {
        self.toolbarMainTitle.title = @"Profile";
        [self manageToolbarSelectedColor : 4];
        AASRegisterViewController * viewController = [[AASRegisterViewController alloc] init];
        
        [self presentViewController:viewController animated:YES completion: ^{
            self.user = viewController.user;
        }];
    }
}

- (void) manageToolbarSelectedColor : (NSInteger) index {
    self.toolbarManageKicksValue.tintColor = [UIColor darkGrayColor];
    self.toolbarHomeValue.tintColor = [UIColor darkGrayColor];
    self.toolbarRankingValue.tintColor = [UIColor darkGrayColor];
    self.toolbarProfileValue.tintColor = [UIColor darkGrayColor];
    switch (index) {
        case 1:
            self.toolbarManageKicksValue.tintColor = [UIColor colorWithRed:82.0/255 green:158.0/255 blue:255.0/255 alpha:1.0];
            break;
        case 2:
            self.toolbarHomeValue.tintColor = [UIColor colorWithRed:82.0/255 green:158.0/255 blue:255.0/255 alpha:1.0];
            break;
        case 3:
            self.toolbarRankingValue.tintColor = [UIColor colorWithRed:82.0/255 green:158.0/255 blue:255.0/255 alpha:1.0];
            break;
        case 4:
            self.toolbarProfileValue.tintColor = [UIColor colorWithRed:52.0/255 green:118.0/255 blue:255.0/255 alpha:1.0];
    }
}

- (IBAction)toolbarMenuAction:(UIBarButtonItem *)sender {
    if (self.viewMenu.hidden) {
        self.viewMenu.hidden = NO;
        [UIView beginAnimations:@"animation1" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationDuration: 0.2];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.viewMenu cache:NO];
        [UIView commitAnimations];
    } else {
        self.viewMenu.hidden = YES;
        [UIView beginAnimations:@"animation2" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationDuration: 0.2];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.viewMenu cache:NO];
        [UIView commitAnimations];
    }
}
@end
