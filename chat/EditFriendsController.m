//
//  EditFriendsController.m
//  chat
//
//  Created by Matthew Weintrub on 11/22/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "EditFriendsController.h"

@interface EditFriendsController ()

@end

@implementation EditFriendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //query all the users by default
    PFQuery *query  = [PFUser query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        } else {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
    
    self.currentUser = [PFUser currentUser];

}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allUsers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //creates relation so users can add friends within the network
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    [friendsRelation addObject:user];
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}



@end
