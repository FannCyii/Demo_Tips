//
//  ViewController.m
//  KeyWindow_A
//
//  Created by kivan on 24/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIWindow *windNew;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.btn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.btn];
    [self.btn addTarget:self action:@selector(showNewWindow:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showNewWindow:(UIButton *)button
{
    NSLog(@"点击");
    self.windNew = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    DemoViewController *vc = [[DemoViewController alloc]init];

    CGRect rect = [self.windNew convertRect:self.btn.frame fromWindow:[UIApplication sharedApplication].keyWindow];
    [vc configButton:rect];
    self.windNew.rootViewController = vc;
    [self.windNew makeKeyAndVisible];
}

- (void)showNewWindow1:(UIButton *)button
{
    [self.windNew resignKeyWindow];
    self.windNew = nil;
    NSLog(@"");
}


@end
