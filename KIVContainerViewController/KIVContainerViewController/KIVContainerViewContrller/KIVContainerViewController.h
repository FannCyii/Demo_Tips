//
//  KIVContainerViewController.h
//  KIVContainerViewController
//
//  Created by chengqifan on 19/04/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KIVContainerViewController : UIViewController

- (void)childVCViewWillAppear:(BOOL)animation;
- (void)childVCViewDidAppear:(BOOL)animation;
- (void)childVCViewWillDisappear:(BOOL)animation;
- (void)childVCViewDidDisappear:(BOOL)animation;

@end
