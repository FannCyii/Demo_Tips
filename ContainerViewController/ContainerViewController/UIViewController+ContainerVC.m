//
//  UIViewController+ContainerVC.m
//  ContainerViewController
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "UIViewController+ContainerVC.h"
#import "KIVContainerViewController.h"
#import "objc/runtime.h"

@implementation UIViewController (ContainerVC)


//- (void)setContainerVC:(KIVContainerViewController *)containerVC{
//    objc_setAssociatedObject(self, @selector(containerVC), containerVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (KIVContainerViewController *)containerVC
//{
//    objc_getAssociatedObject(self, _cmd);
//}
//
//
//- (void)addChildViewController:(UIViewController *)childController
//{
//    if(childController == nil){
//        return;
//    }
//}


@end


@implementation UIViewController (RelationshipVC)

- (void)addChildVC:(__kindof UIViewController *)childVC
{
    if (childVC == nil) {
        return ;
    }
    [self addChildViewController:childVC];
    [self.view addSubview:childVC.view];
    childVC.view.frame = self.view.frame;
}

- (void)removeChildVC:(__kindof UIViewController *)childVC
{
    [childVC removeFromParentViewController];
}

@end
