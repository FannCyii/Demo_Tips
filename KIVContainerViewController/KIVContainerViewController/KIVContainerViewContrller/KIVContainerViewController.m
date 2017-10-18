//
//  KIVContainerViewController.m
//  KIVContainerViewController
//
//  Created by chengqifan on 19/04/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "KIVContainerViewController.h"

#define FuncLog NSLog(@"%@:%@",self,NSStringFromSelector(_cmd));


@interface KIVContainerViewController ()

@end

@implementation KIVContainerViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    FuncLog
}

- (void)viewDidLoad {
    [super viewDidLoad];
    FuncLog
}

#pragma mark - Appearance LifeCycle
- (void)childVCViewWillAppear:(BOOL)animation
{
    NSArray * childVCs = [self childViewControllersNeededAppearence];
    for (UIViewController *vc in childVCs) {
        [vc beginAppearanceTransition:YES animated:animation];
    }
    FuncLog
}

- (void)childVCViewDidAppear:(BOOL)animation
{
    NSArray * childVCs = [self childViewControllersNeededAppearence];
    for (UIViewController *vc in childVCs) {
        [vc endAppearanceTransition];
    }
    FuncLog
}

- (void)childVCViewWillDisappear:(BOOL)animation
{
    NSArray * childVCs = [self childViewControllersNeededAppearence];
    for (UIViewController *vc in childVCs) {
        [vc beginAppearanceTransition:NO animated:animation];
    }
    FuncLog
}

- (void)childVCViewDidDisappear:(BOOL)animation
{
    NSArray * childVCs = [self childViewControllersNeededAppearence];
    for (UIViewController *vc in childVCs) {
        [vc endAppearanceTransition];
    }
    FuncLog
}

#pragma mark - is AutoCallBack apparence and rotation
- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
    return NO;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    
    NSArray * vcs = [self childViewControllersNeededRotation];
    for (UIViewController *vc in vcs) {
        [vc viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    }
}

#pragma mark - Rotation


#pragma mark - Rotation CallBack


#pragma mark - ChildViewController that needed handel, such as appearence and rotation
- (NSArray *)childViewControllersNeededAppearence
{   FuncLog
    return self.childViewControllers;
}

- (NSArray *)childViewControllersNeededRotation
{
    FuncLog
    return self.childViewControllers;
}

#pragma mark - ChildViewController Dispach
- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *topVC = [self topChildViewControler];
    [self removeChildViewController:topVC];
    return topVC;
}

- (nullable NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSMutableArray * popVCs = [NSMutableArray array];
    for (UIViewController *vc in [self childViewControllersNeededAppearence]) {
        if (vc == viewController){
            
            break;
        }
        [popVCs addObject:vc];
        [self popToViewController:vc animated:animated];
    }
    return popVCs;
}

- (UIViewController *)topChildViewControler
{
    NSInteger count = self.childViewControllers.count;
    if( count == 0 ){
        return nil;
    }
    return self.childViewControllers[count - 1];
}

- (void)removeChildViewController:(UIViewController *)vc
{
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
}

@end
