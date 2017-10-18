//
//  ViewController.m
//  OBJC
//
//  Created by chengqifan on 07/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "ViewController.h"
#import "MyObject.h"
#import "TestView.h"

#import "KIVTestCategory.h"

#import "NSObject+KIVObjectExtention.h"

@interface ViewController ()
@property (nonatomic,readwrite, strong)MyObject * myObject;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    KIVTestCategory * testc = [[KIVTestCategory alloc]init];
//    if ([testc respondsToSelector:@selector(extentionTest)]) {
//        [testc performSelector:@selector(extentionTest)];
//    }
//    MyObject * myobjc = [[MyObject alloc]init];
    
//    NSLog(@"%@", [myobjc kiv_getAllPropertyName]);
//    
//    NSLog(@"%@", [MyObject kiv_getAllClassPropertyName]);
    //NSLog(@"%@", [myobjc kiv_getAllObjcVarsName]);
    
    TestView * view1 = [[TestView alloc]init];

    //[view1 performSelector:@selector(ObjectTest001)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
