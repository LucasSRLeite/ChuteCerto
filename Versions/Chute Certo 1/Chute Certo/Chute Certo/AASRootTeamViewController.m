//
//  AASRootTeamViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/29/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASRootTeamViewController.h"
#import "AASRootTeam.h"
#import "AASMainViewController.h"


@interface AASRootTeamViewController ()

@end

@implementation AASRootTeamViewController

#pragma mark - ViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.isFormFinished = NO;
    
    self.toolbarAddValue.enabled = NO;
    
    if (self.arrayTeam == nil) {
        self.arrayTeam = [[NSMutableArray alloc] init];
    }
    
    self.pickerViewGoldenPlayer = [[UIPickerView alloc] init];
    
    [self.pickerViewGoldenPlayer setDataSource: self];
    [self.pickerViewGoldenPlayer setDelegate: self];
    
    [self.pickerViewGoldenPlayer setFrame: CGRectMake(self.view.bounds.size.width/2-150, self.view.bounds.size.height-200, 300, 162.0)];
    
    self.pickerViewGoldenPlayer.showsSelectionIndicator = YES;
    
    [self.pickerViewGoldenPlayer selectRow:0 inComponent:0 animated:YES];
    
    [self.view addSubview: self.pickerViewGoldenPlayer];
    
    self.pickerViewGoldenPlayer.backgroundColor = [UIColor clearColor];
    self.pickerViewGoldenPlayer.hidden = YES;
    
    [self addFlagsInScrollView];
    
    if (self.user.team == nil) {
        self.user.team = [[AASRootTeam alloc] init];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillDisappear:(BOOL)animated {
    [UIView beginAnimations:@"animation1" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration: 0.7];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:NO];
    [UIView commitAnimations];
}

#pragma mark - PickerView Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 23;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    const int width = 280;
    
    int indexTeam = self.scrollViewFlags.contentOffset.x / width;
    
    NSString * title = @"";
    
    if ((self.arrayTeam.count != 0) &&
                    ([[self.arrayTeam objectAtIndex:indexTeam] players] != nil)) {
        NSString * player = [[[self.arrayTeam objectAtIndex:indexTeam] players] objectAtIndex:row];
        
        title = [NSString stringWithFormat:@"%@", player];
    }

    return title;
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.pickerViewGoldenPlayer) {

    }
}

#pragma mark - Toolbar Methods

- (IBAction)toolbarChooseAction:(UIBarButtonItem *)sender {
    if ([[self.arrayTeam objectAtIndex:0] players] != nil) {
        self.textViewTitle.text = @"Chute Bola de Ouro\n(Melhor jogador da Copa)";
        self.pickerViewGoldenPlayer.hidden = NO;
        self.toolbarAddValue.enabled = YES;
    } else {
        self.textViewTitle.text = @"Chute Chuteira de Ouro\n(Artilheiro jogador da Copa)";
        self.pickerViewGoldenPlayer.hidden = NO;
        self.toolbarAddValue.enabled = YES;
    }
}

- (IBAction)toolbarReturnAction:(UIBarButtonItem *)sender {
    self.user.team = nil;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)toolbarAddRootTeamAction:(UIBarButtonItem *)sender {
    self.isFormFinished = YES;
    [self receiveTeamIndex];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MyMethods

- (void) addFlagsInScrollView {
    self.scrollViewFlags.backgroundColor = [UIColor clearColor];
    
    for (int i = 1; i < 33; i++) {
        CGFloat width = self.scrollViewFlags.bounds.size.width*(i-1);
        
        UIImageView * flag = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, 280, 175)];
        flag.image = [UIImage imageNamed:[NSString stringWithFormat:@"Flag %d", i]];
        
        [self addTeamInArrayFlag : flag.image andCount : i];
        
        [self.scrollViewFlags addSubview:flag];
        
        width += 280;
        CGRect scrollRect = CGRectMake(width, 0, width, 175);
        [self.scrollViewFlags setContentSize: scrollRect.size];
    }
    
//    self.scrollViewFlags.pagingEnabled = YES;
}

- (void) addTeamInArrayFlag : (UIImage *) flag andCount : (int) i {
    AASRootTeam * team = [[AASRootTeam alloc] init];

    team.flag = flag;

    switch (i) {
        case 1:
            team.name = @"Alemanha";
            team.players = [self addGermanyPlayers];
            break;
        case 2 :
            team.name = @"Algeria";
            team.players = [self addAlgeriaPlayers];
            break;
        case 3 :
            team.name = @"Argentina";
            team.players = [self addArgentinaPlayers];
            break;
        case 4 :
            team.name = @"Austrália";
            break;
        case 5 :
            team.name = @"Belgica";
            break;
        case 6 :
            team.name = @"Bósnia";
            break;
        case 7 :
            team.name = @"Brasil";
            team.players = [self addBrasilPlayers];
            break;
        case 8 :
            team.name = @"Camarōes";
            break;
        case 9 :
            team.name = @"Chile";
            break;
        case 10 :
            team.name = @"Colômbia";
            break;
        case 11 :
            team.name = @"Coreia do Sul";
            break;
        case 12 :
            team.name = @"Costa do Marfim";
            break;
        case 13 :
            team.name = @"Costa Rica";
            break;
        case 14 :
            team.name = @"Croácia";
            break;
        case 15 :
            team.name = @"Equador";
            break;
        case 16 :
            team.name = @"Espanha";
            break;
        case 17 :
            team.name = @"Estados Unidos";
            break;
        case 18 :
            team.name = @"França";
            break;
        case 19 :
            team.name = @"Gana";
            break;
        case 20 :
            team.name = @"Grécia";
            break;
        case 21 :
            team.name = @"Holanda";
            break;
        case 22 :
            team.name = @"Honduras";
            break;
        case 23 :
            team.name = @"Inglaterra";
            break;
        case 24 :
            team.name = @"Irã";
            break;
        case 25 :
            team.name = @"Itália";
            break;
        case 26 :
            team.name = @"Japão";
            break;
        case 27 :
            team.name = @"México";
            break;
        case 28 :
            team.name = @"Nigéria";
            break;
        case 29 :
            team.name = @"Portugal";
            break;
        case 30 :
            team.name = @"Rússia";
            break;
        case 31 :
            team.name = @"Suíça";
            break;
        case 32 :
            team.name = @"Uruguai";
            break;
    }
    
    [self.arrayTeam addObject:team];
}

- (NSMutableArray *) addGermanyPlayers {
    NSMutableArray * players = [[NSMutableArray alloc] init];
    
    [players addObject:@"Manuel Neuer"];
    [players addObject:@"Weidenfeller"];
    [players addObject:@"Ron-Robert Zieler"];
    [players addObject:@"Jerome Boateng"];
    [players addObject:@"Erik Durm"];
    [players addObject:@"Kevin Grosskreutz"];
    [players addObject:@"Benedikt Howedes"];
    [players addObject:@"Mats Hummels"];
    [players addObject:@"Philipp Lahm"];
    [players addObject:@"Per Mertesacker"];
    [players addObject:@"Julian Draxler"];
    [players addObject:@"Matthias Ginter"];
    [players addObject:@"Mario Gotze"];
    [players addObject:@"Christoph Kramer"];
    [players addObject:@"Sami Khedira"];
    [players addObject:@"Toni Kroos"];
    [players addObject:@"Thomas Muller "];
    [players addObject:@"Mesut Ozil"];
    [players addObject:@"Marco Reus"];
    [players addObject:@"Andre Schurrle"];
    [players addObject:@"Schweinsteiger"];
    [players addObject:@"Miroslav Klose"];
    [players addObject:@"Lukas Podolski"];
    
    return players;
}

- (NSMutableArray *) addAlgeriaPlayers {
    NSMutableArray * players = [[NSMutableArray alloc] init];
    
    [players addObject:@"Rais Mbolhi"];
    [players addObject:@"Cedric Si Mohamed"];
    [players addObject:@"Mohamed Lamine Zemmamouche"];
    [players addObject:@"Essaid Belkalem"];
    [players addObject:@"Madjid Bougherra"];
    [players addObject:@"Liassine Cadamuro"];
    [players addObject:@"Faouzi Ghoualm"];
    [players addObject:@"Rafik Halliche"];
    [players addObject:@"Aissa Mandi"];
    [players addObject:@"Carl Medjani"];
    [players addObject:@"Djamel Mesbah"];
    [players addObject:@"Mehdi Mostefa"];
    [players addObject:@"Nabil Bentaleb"];
    [players addObject:@"Yasine Brahimi"];
    [players addObject:@"Medhi Lacen"];
    [players addObject:@"Saphir Taider"];
    [players addObject:@"Hassan Yebda"];
    [players addObject:@"Abdelmoumene Djabou"];
    [players addObject:@"Sofiane Feghouli"];
    [players addObject:@"Nabil Ghilas"];
    [players addObject:@"Riyad Mahrez"];
    [players addObject:@"Islam Slimani"];
    [players addObject:@"Hilal Soudani"];
    
    return players;
}

- (NSMutableArray *) addArgentinaPlayers {
    NSMutableArray * players = [[NSMutableArray alloc] init];
    
    [players addObject:@"Sergio Romero"];
    [players addObject:@"Mariano Andujar"];
    [players addObject:@"Agustin Orion"];
    [players addObject:@"Pablo Zabaleta"];
    [players addObject:@"Federico Fernandez"];
    [players addObject:@"Ezequiel Garay"];
    [players addObject:@"Marcos Rojo"];
    [players addObject:@"Hugo Campagnaro"];
    [players addObject:@"Martin Demichelis"];
    [players addObject:@"Jose Basanta"];
    [players addObject:@"Javier Mascherano"];
    [players addObject:@"Fernando Gago"];
    [players addObject:@"Lucas Biglia"];
    [players addObject:@"Ricardo Alvarez"];
    [players addObject:@"Augusto Fernandez"];
    [players addObject:@"Angel Di Maria"];
    [players addObject:@"Maxi Rodriguez"];
    [players addObject:@"Enzo Perez"];
    [players addObject:@"Lionel Messi"];
    [players addObject:@"Gonzalo Higuain"];
    [players addObject:@"Sergio Aguero"];
    [players addObject:@"Rodrigo Palacio"];
    [players addObject:@"Ezequiel Lavezzi "];
    
    return players;
}

- (NSMutableArray *) addBrasilPlayers {
    NSMutableArray * players = [[NSMutableArray alloc] init];
    
    [players addObject:@"Julio Cesar"];
    [players addObject:@"Thiago Silva"];
    [players addObject:@"David Luiz"];
    [players addObject:@"Marcelo"];
    [players addObject:@"Daniel Alves"];
    [players addObject:@"Fernandinho"];
    [players addObject:@"Paulinho"];
    [players addObject:@"Oscar"];
    [players addObject:@"Hulk"];
    [players addObject:@"Neymar"];
    [players addObject:@"Fred"];
    
    return players;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self receiveTeamIndex];
    [self.pickerViewGoldenPlayer reloadAllComponents];
}

- (void) receiveTeamIndex {
    const int width = 280;
    
    int indexTeam = self.scrollViewFlags.contentOffset.x / width;
    
    self.labelTeamName.text = [[self.arrayTeam objectAtIndex:indexTeam] name];
    
    self.user.team = [[AASRootTeam alloc] init];
    
    self.user.team = [self.arrayTeam objectAtIndex:indexTeam];
}

@end
