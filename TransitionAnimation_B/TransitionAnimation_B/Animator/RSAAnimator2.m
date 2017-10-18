//
//  RSAAnimator2.m
//  TransitionAnimation_B
//
//  Created by chengqifan on 05/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "RSAAnimator2.h"
#import "GPUImage.h"
#import "UIView+KIVViewGeometry.h"

@interface RSAAnimator2 ()

@property (nonatomic) CADisplayLink *displayLink;
@property (nonatomic) GPUImageGaussianBlurFilter *gaussinaBlurFilter;

@end

@implementation RSAAnimator2

-(instancetype)init
{
    self = [super init];
    if (self){
        //self.displayLink.paused = YES;
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(frame:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


#pragma mark -UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.frame = CGRectMake(toViewController.view.originX - toViewController.view.sizeWidth, toViewController.view.originY,toViewController.view.sizeWidth, toViewController.view.sizeHeight);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = fromViewController.view.frame;
        //fromViewController.view.frame = CGRectMake(fromViewController.view.originX-fromViewController.view.sizeWidth, fromViewController.view.originY, fromViewController.view.sizeWidth, fromViewController.view.sizeHeight);
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

#pragma mark -UIViewControllerInteractiveTransitioning
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
}


- (CADisplayLink *)displayLink
{
    if(_displayLink == nil){
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(frame:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return _displayLink;
}

- (void)frame:(CADisplayLink*)link
{
    NSLog(@"- (void)frame:(CADisplayLink*)link");
    //self.progress = MAX(0, MIN((link.timestamp - self.startTime) / duration, 1));
    //self.blend.mix = self.progress;
//    self.sourcePixellateFilter.fractionalWidthOfAPixel = self.percentComplete *0.1;
//    self.targetPixellateFilter.fractionalWidthOfAPixel = (1- self.percentComplete)*0.1;
//    [self triggerRenderOfNextFrame];
}

@end
