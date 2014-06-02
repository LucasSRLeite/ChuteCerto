//
//  AASRegisterViewController.h
//  Chute Certo
//
//  Created by Arthur Marques on 5/28/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AASUser.h"

@interface AASRegisterViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (nonatomic) AASUser * user;

@property (weak, nonatomic) IBOutlet UILabel *labelError;

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewRegister;

@property (weak, nonatomic) IBOutlet UIImageView *imageFotoUpload;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlSexoValue;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbarPhoto;

- (IBAction)toolbarAddForm:(UIBarButtonItem *)sender;
- (IBAction)toolbarCameraButton:(id)sender;
- (IBAction)toolbarReturnAction:(UIBarButtonItem *)sender;

- (IBAction)segmentedControlSexo:(UISegmentedControl *)sender;

- (void) receiveForm;
- (BOOL) isFormReady;
- (void) showSecondView;

@end
