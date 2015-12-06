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
    
//    NSURL *imageFileURL = [[NSURL alloc]initWithString:imageFile.url];
//    
//    NSData *imageData = [NSData dataWithContentsOfURL:imageFileURL];
//    
//    self.imageView.image = [UIImage imageWithData:imageData];
    self.imageView.image = [UIImage imageWithData:[imageFile getData]];

}

@end
