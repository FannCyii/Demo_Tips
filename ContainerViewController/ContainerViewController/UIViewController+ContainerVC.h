//
//  UIViewController+ContainerVC.h
//  ContainerViewController
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KIVContainerViewController;

@interface UIViewController (ContainerVC)

@property (nonatomic, readwrite, weak) KIVContainerViewController * containerVC;

@end




@interface UIViewController (RelationshipVC)

- (void)addChildVC:(__kindof UIViewController *)childVC;
- (void)removeChildVC:(__kindof UIViewController *)childVC;
@end
