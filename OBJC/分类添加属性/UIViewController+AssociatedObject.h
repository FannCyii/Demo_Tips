//
//  UIViewController+AssociatedObject.h
//  OBJC
//
//  Created by chengqifan on 07/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AssociatedObject)

@property (nonatomic, readwrite, strong)NSString * associatedStrong;
//@property (nonatomic, readwrite, copy)NSString * associatedCopy;
//@property (nonatomic, readwrite, assign)NSInteger associatedAssign;

@end
