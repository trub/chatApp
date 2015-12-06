//
//  ImageViewController.m
//  chat
//
//  Created by Matthew Weintrub on 12/5/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    PFFile *imageFile = [self.message objectForKey:@"file"];
    self.imageView.image = [UIImage imageWithData:[imageFile getData]];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if ([self respondsToSelector:@selector(timeout)]) {
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
    }
    else {
        NSLog(@"error");
    }
}

#pragma mark - Helper Functions

- (void) timeout {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
