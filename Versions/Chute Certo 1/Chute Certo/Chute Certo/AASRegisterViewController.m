//
//  AASRegisterViewController.m
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASRegisterViewController.h"
#import "AASRootTeamViewController.h"
#import "AASMainViewController.h"

@interface AASRegisterViewController ()

@end

@implementation AASRegisterViewController

#pragma mark - ViewController Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.textFieldName.delegate = self;
        self.textFieldEmail.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    
    tapGesture.cancelsTouchesInView = NO;
    
    [self.scrollViewRegister addGestureRecognizer:tapGesture];
    self.scrollViewRegister.pagingEnabled = YES;
    
    UIPageControl * pageControl = [[UIPageControl alloc] initWithFrame:
                                   CGRectMake(self.view.bounds.size.width/2-18, self.view.bounds.size.height-70, 480, 36)];
    
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [pageControl setTag:12];
    pageControl.numberOfPages = 3;
    pageControl.autoresizingMask = UIViewAutoresizingNone;
    
    [self.view addSubview:pageControl];
    
    if (self.user == nil) {
        self.user = [[AASUser alloc] init];
    }
    
}

-(void)viewDidAppear:(BOOL)animated {
    if (self.user.team != nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - TextField Methods

-(void)hideKeyboard {
    [self.textFieldName resignFirstResponder];
    [self.textFieldEmail resignFirstResponder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if ([self isFormReady]) {
        [self showSecondView];
    }
}

#pragma mark - Toolbar Methods

- (IBAction)toolbarAddForm:(UIBarButtonItem *)sender {
    if ([self isFormReady]) {
        [self showSecondView];
    }
}

- (IBAction)toolbarCameraButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)toolbarReturnAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - PickerView Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.imageFotoUpload.image = image;

    [self dismissViewControllerAnimated:YES completion:nil];
    if ([self isFormReady]) {
        [self showSecondView];
    }
}

#pragma mark - MyMethods

- (IBAction)segmentedControlSexo:(UISegmentedControl *)sender {
    
}

- (BOOL) isFormReady {
    if ([self.textFieldName.text isEqualToString:@""]) {
        self.labelError.text = @"Apelido inválido.";
        return NO;
    }
    if ([self.textFieldEmail.text isEqualToString:@""]) {
        self.labelError.text = @"Email inválido.";
        return NO;
    }
    self.labelError.text = @"";
    [self receiveForm];
    return YES;
}

- (void) receiveForm {
    self.user.name = self.textFieldName.text;
    self.user.email = self.textFieldEmail.text;
    self.user.sexo = self.segmentedControlSexoValue.selectedSegmentIndex;
    self.user.photo = self.imageFotoUpload.image;
}

- (void) showSecondView {
    AASRootTeamViewController * viewController = [[AASRootTeamViewController alloc] init];
    viewController.user = self.user;

    [self presentViewController:viewController animated:YES completion:^{
        self.user.team = viewController.user.team;
    }];
}

@end
