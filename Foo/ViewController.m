//
//  ViewController.m
//  Foo
//
//  Created by Alan Lu on 9/10/14.
//  Copyright (c) 2014 Duobao. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	s = [[LuStepper alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    [self.view addSubview:s];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 100, 88, 100)];
    [button setTitle:@"Get value" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonDidTap:(id)sender {
    NSLog(@"value: %d", s.value);
}
@end