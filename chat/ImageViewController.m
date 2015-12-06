//
//  ImageViewController.m
//  chat
//
//  Created by Matthew Weintrub on 12/5/15.
//  Copyright © 2015 matthew weintrub. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    PFFile *imageFile = [self.message objectForKey:@"file"];
    UIImage *imageData = [UIImage imageWithData:[imageFile getData]];
    if (imageData != NULL) {
        self.imageView.image = imageData;
    }
    else {
        NSLog(@"error");
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
        
    if ([self respondsToSelector:@selector(timeout)]) {
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
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
