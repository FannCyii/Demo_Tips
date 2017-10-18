//
//  ViewController.m
//  Demo_Tips
//
//  Created by chengqifan on 17/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+JUSTTest001.h"

@interface ViewController ()
@property (nonatomic, strong, readwrite)NSString * testStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject * objc = [[NSObject alloc]init];
    if ([objc respondsToSelector:@selector(ObjectTest001)])
    {
        [objc performSelector:@selector(ObjectTest001)];
    }
    
    [objc ObjectTest001];
}
- (IBAction)buttonClick:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
