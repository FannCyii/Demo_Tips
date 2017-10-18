//
//  ViewController.m
//  NetWork_A
//
//  Created by chengqifan on 31/03/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * str = @"NOccc";
    NSLog(@"%@",str?:@"abc");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
