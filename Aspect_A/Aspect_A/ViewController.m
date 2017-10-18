//
//  ViewController.m
//  Aspect_A
//
//  Created by chengqifan on 20/04/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+SafeArray.h"

@interface ViewController () 

@end

@implementation ViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [super allocWithZone:zone];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self aspect_hookSelector:@selector(testAAAA:) withOptions:AspectPositionBefore usingBlock:^{
//        NSLog(@"before : testAAAA:");
//    }error:nil];
//    [self aspect_hookSelector:@selector(testAAAA:) withOptions:AspectPositionAfter usingBlock:^{
//        NSLog(@"after : testAAAA:");
//    }error:nil];
//    
//    [self testAAAA:@"test"];
    
    
    NSMutableArray * array = @[].mutableCopy;
    //[array addObject:nil];
    [array addObject:@"aaaa"]; //????
    
    
}

- (void)testAAAA:(NSString *)add
{
    NSLog(@"testAAAA");
}

- (void)testBBBB
{
    NSLog(@"BBBBBBB");
}

- (void)testCCCC
{
    NSLog(@"CCCCCCC");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"原始didReceiveMemoryWarning");
}


@end
