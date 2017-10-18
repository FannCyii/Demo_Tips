//
//  KIVVCTransitionAnimator.h
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KIVTransitionAnimationType)
{
    KIVTransitionUpWard = 1,
    KIVTransitionDownWard,
    KIVTransitionLeftWard,
    KIVTransitionRightWard,
    
    KIVTransitionZoomToCenter,
};



@interface KIVVCTransitionAnimator : UIViewController <UIViewControllerAnimatedTransitioning>

@property(nonatomic, readwrite, assign)KIVTransitionAnimationType animationType;

@end
