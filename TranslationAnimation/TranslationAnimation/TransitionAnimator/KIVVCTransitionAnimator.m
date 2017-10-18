//
//  KIVVCTransitionAnimator.m
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "KIVVCTransitionAnimator.h"
#import "UIView+KIVViewGeometry.h"

@implementation KIVVCTransitionAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.animationType) {
        case KIVTransitionUpWard:
            [self upwardAnimation:transitionContext];
            break;
        case KIVTransitionDownWard:
            [self downwardAnimation:transitionContext];
            break;
        case KIVTransitionLeftWard:
            [self leftwardAnimation:transitionContext];
            break;
        case KIVTransitionRightWard:
            [self rightwardAnimation:transitionContext];
            break;
        case KIVTransitionZoomToCenter:
            [self zoomToCenterAnimation:transitionContext];
            break;
        default:
            [self leftwardAnimation:transitionContext];
            break;
    }
}

- (void)upwardAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.frame = CGRectMake(toViewController.view.originX, toViewController.view.originY + toViewController.view.sizeHeight, toViewController.view.sizeWidth, toViewController.view.sizeHeight);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

- (void)downwardAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.frame = CGRectMake(toViewController.view.originX, toViewController.view.originY - toViewController.view.sizeHeight, toViewController.view.sizeWidth, toViewController.view.sizeHeight);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

- (void)leftwardAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.frame = CGRectMake(toViewController.view.originX - toViewController.view.sizeWidth, toViewController.view.originY,toViewController.view.sizeWidth, toViewController.view.sizeHeight);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

- (void)rightwardAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.frame = CGRectMake(toViewController.view.originX + toViewController.view.sizeWidth, toViewController.view.originY,toViewController.view.sizeWidth, toViewController.view.sizeHeight);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

- (void)zoomToCenterAnimation:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
