//
//  ViewController.m
//  GNGeneralNullValue
//
//  Created by DjangoZhang on 15/3/22.
//  Copyright (c) 2015年 DjangoZhang. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *fixCrashbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    fixCrashbutton.frame = (CGRect){CGPointZero, {100, 100}};
    fixCrashbutton.backgroundColor = [UIColor lightGrayColor];
    [fixCrashbutton setTitle:@"Fix Crash" forState:UIControlStateNormal];
    [fixCrashbutton addTarget:self action:@selector(fixCrash:) forControlEvents:UIControlEventTouchUpInside];
    fixCrashbutton.center= self.view.center;
    [self.view addSubview:fixCrashbutton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fixCrash:(UIButton *)sender {
    NSArray *titles = [[self mediaItems] valueForKey:@"title"];
    NSLog(@"title:%d-%d", [[titles firstObject] integerValue], [[titles lastObject] integerValue]);
}

- (NSArray *)mediaItems {
    return @[[[TestModel alloc] init], [[TestModel alloc] init]];
}

@end
