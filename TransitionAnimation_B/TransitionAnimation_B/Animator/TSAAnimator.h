//
//  TSAAnimator.h
//  TransitionAnimation_B
//
//  Created by chengqifan on 04/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, KIVTransitionAnimationType)
{
    KIVTransitionUpWard = 1,
    KIVTransitionDownWard,
    KIVTransitionLeftWard,
    KIVTransitionRightWard,
    
    KIVTransitionZoomToCenter,
};


@import UIKit;
@interface TSAAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property(nonatomic, readwrite, assign)KIVTransitionAnimationType animationType;

@end
