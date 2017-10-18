//
//  UIViewController+KIVContainerExtension.m
//  ContainerViewController
//
//  Created by chengqifan on 19/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "UIViewController+KIVContainerExtension.h"

@implementation UIViewController (KIVContainerExtension)

- (void)addChildVC:(UIViewController *)childVC
{
    [self addChildViewController:childVC];  //在调用addChildViewController方法前系统会自动调用willMoveToParentViewController方法，
    [self.view addSubview:childVC.view];
    [childVC didMoveToParentViewController:self]; //以通知child，完成了父子关系的建立。根据父类初始化情况可以分为两类：1 和父类一起初始化，按照父类-子类-父类-子类的形式初始化。2 在父类初始化完成后，通过某个时间出发子类初始化（如点击按钮），子类的viewWillAppear:和viewDidAppear:都会调用didMoveToParentViewController（即两次）。
    
}

- (void)removeChildVC:(UIViewController *)childVC
{
    //[childVC didMoveToParentViewController:nil]; //无需添加 这个方法
    [childVC.view removeFromSuperview];
    [childVC removeFromParentViewController];//removeFromParentViewController会自动调用 [content didMoveToParentViewController:nil],在viewWillAppear:和viewDidAppear:后都会调用[content didMoveToParentViewController:nil] （即两次），第一次调用后会执行 removeFromParentViewController方法
}

@end
