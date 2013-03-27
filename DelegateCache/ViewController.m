//
//  ViewController.m
//  DelegateCache
//
//  Created by zhouchao on 13-3-26.
//  Copyright (c) 2013年 zhouchao. All rights reserved.
//

#import "ViewController.h"
#import "MyAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 60, 20)];
    
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick:(id)sender
{
    MyAlertView *myAlert = [[MyAlertView alloc] initWithTitle:@"DelegateCache:" message:@"call Delegate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    myAlert.mydelegate = self;
    
    [myAlert show];
    [myAlert release];
}

- (void)logMessage:(NSString *)message
{
    NSLog(@"logMessage %@\n", message);
}

@end
