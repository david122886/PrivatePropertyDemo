//
//  ViewController.m
//  PrivatePropertyDemo
//
//  Created by liudavid on 16/9/1.
//  Copyright © 2016年 liudavid. All rights reserved.
//

#import "ViewController.h"
#import "B.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    B *testB = [B new];
    [testB testProperty];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
