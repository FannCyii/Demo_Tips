//
//  TSAAnimator.m
//  TransitionAnimation_B
//
//  Created by chengqifan on 04/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "TSAAnimator.h"
#import "UIView+KIVViewGeometry.h"

#import "UIView+screenShot.h"
#import "GPUImage.h"


@interface TSAAnimator ()

@end

@implementation TSAAnimator

// This is used for percent driven interactive transitions, as well as for
// container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
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
    
    UIImageView *gausImageView = [self imageGaussBlurFilter:fromViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
        //fromViewController.view.frame = CGRectMake(fromViewController.view.originX+fromViewController.view.sizeWidth, fromViewController.view.originY, fromViewController.view.sizeWidth, fromViewController.view.sizeHeight);
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [gausImageView removeFromSuperview];
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
        //fromViewController.view.frame = CGRectMake(fromViewController.view.originX-fromViewController.view.sizeWidth, fromViewController.view.originY, fromViewController.view.sizeWidth, fromViewController.view.sizeHeight);
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

//设置高斯模糊
- (UIImageView *)imageGaussBlurFilter:(UIView *)aView
{
    GPUImageGaussianBlurFilter *fastBlur = [[GPUImageGaussianBlurFilter alloc]init];
    UIImage *gaImage = [fastBlur imageByFilteringImage:[aView viewShot]];
    UIImageView *fullImageView  = [[UIImageView alloc]initWithImage:gaImage];
    
    fullImageView.frame = aView.bounds;
    [aView addSubview:fullImageView];
    return fullImageView;
}


@end
