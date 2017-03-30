//
//  ChildViewController.m
//  ContainerViewController
//
//  Created by chengqifan on 17/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    [btn addTarget:self  action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick
{
    [self removeFromParentViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"child: viewWillAppear:(BOOL)animated");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"child: viewDidAppear:(BOOL)animated");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"child: viewWillDisappear:(BOOL)animated");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)removeFromParentViewController
{
    [super removeFromParentViewController];
    NSLog(@"child: removeFromParentViewController");
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
    NSLog(@"child: willMoveToParentViewController:(UIViewController *)parent ");
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    [super didMoveToParentViewController:parent];
    NSLog(@"child: didMoveToParentViewController:(UIViewController *)parent");
}

@end
