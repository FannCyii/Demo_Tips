//
//  ViewController.m
//  AOP_B
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+safeMutableArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray * arr = [NSMutableArray array];
    [arr addObject:@"aaaa"];
    
    NSMutableSet * set = [NSMutableSet set];
    [set addObject:@"bbbb"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
