//
//  UIView+HierarchyExtension.h
//  KeyWindow_A
//
//  Created by kivan on 18/07/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HierarchyExtension)
- (void)recursionView:(UIView *)rootView hierarchy:(NSInteger)index;
@end
