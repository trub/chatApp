//
//  InboxViewController.h
//  chat
//
//  Created by Matthew Weintrub on 11/21/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;

- (IBAction)logoutButtonPressed:(id *)sender;

@end
