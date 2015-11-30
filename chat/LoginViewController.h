//
//  LoginViewController.h
//  chat
//
//  Created by Matthew Weintrub on 11/21/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginButtonPressed:(id)sender;

@end
