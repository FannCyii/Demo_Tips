//
//  KIVMainViewController.m
//  ContainerViewController
//
//  Created by chengqifan on 19/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "KIVMainViewController.h"
#import "KIVViewController1.h"

@interface KIVMainViewController ()

@end

@implementation KIVMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *pushButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [pushButton setTitle:@"点击跳转" forState:UIControlStateNormal];
    pushButton.backgroundColor = [UIColor greenColor];
    [pushButton addTarget:self action:@selector(clickPushButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickPushButton
{
    [[KIVControllerDispach shareController] pushVC:[[KIVViewController1 alloc]init]];
}

@end
