//
//  KIVContainerViewController.m
//  ContainerViewController
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "KIVContainerViewController.h"
#import "UIViewController+ContainerVC.h"

@interface KIVContainerViewController ()

@end

@implementation KIVContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//overwrite
- (void)addChildViewController:(__kindof UIViewController *)childController
{
    if (childController == nil){
        return;
    }
    [super addChildViewController:childController];
    childController.containerVC = self;
}



@end
