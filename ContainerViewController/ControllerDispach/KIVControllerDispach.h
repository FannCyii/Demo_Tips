//
//  KIVControllerDispach.h
//  ContainerViewController
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KIVControllerDispach : UIViewController

+ (instancetype)shareController;



- (void)pushVC:(UIViewController *)vc;

- (UIViewController *)popVC;

@end
