//
//  ViewController.m
//  Demo_Tips
//
//  Created by chengqifan on 17/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong, readwrite)NSString * testStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _testStr = @"abcd123";
    
    void (^blk)(void)= ^{
        NSLog(@"%@",_testStr);
    };
    blk();
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
