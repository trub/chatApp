//
//  EditFriendsController.h
//  chat
//
//  Created by Matthew Weintrub on 11/22/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;
@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSMutableArray *friends;


- (BOOL)isFriend:(PFUser *)user;

@end
