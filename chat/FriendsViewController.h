//
//  FriendsViewController.h
//  chat
//
//  Created by Matthew Weintrub on 11/23/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;

@end
