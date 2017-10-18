//
//  UIViewController+KIVContainerExtension.h
//  ContainerViewController
//
//  Created by chengqifan on 19/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KIVContainerExtension)

- (void)addChildVC:(UIViewController *)childVC;
- (void)removeChildVC:(UIViewController *)childVC;

@end
