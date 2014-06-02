//
//  AASAppDelegate.m
//  Chute Certo
//
//  Created by Arthur Augusto Sousa Marques on 5/27/14.
//  Copyright (c) 2014 Arthur Augusto. All rights reserved.
//

#import "AASAppDelegate.h"
#import "AASLoginViewController.h"
#import "AASMainViewController.h"

@implementation AASAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

//    AASFacebookLoginViewController *loginUIViewController = [[AASFacebookLoginViewController alloc] init];
//    self.window.rootViewController = loginUIViewController;
    
//    AASLoginViewController * viewController = [[AASLoginViewController alloc] init];
//    self.window.rootViewController = viewController;

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    AASMainViewController * viewController = [[AASMainViewController alloc] init];
    self.window.rootViewController = viewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

// In order to process the response you get from interacting with the Facebook login process,
// you need to override application:openURL:sourceApplication:annotation:
/*- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
    BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    // You can add your app-specific url handling code here if needed
    
    return wasHandled;
}*/

@end
