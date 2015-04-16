//
//  ViewController.m
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/3/22.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fixCrash:(UIButton *)sender {
    NSArray *titles = [[self mediaItems] valueForKey:@"title"];
    NSLog(@"title:%@", titles);
}

- (NSArray *)mediaItems {
    return @[[[MPMediaItem alloc] init], [[MPMediaItem alloc] init]];
}

@end
