//
//  UIView+HierarchyExtension.m
//  KeyWindow_A
//
//  Created by kivan on 18/07/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "UIView+HierarchyExtension.h"

NSInteger  count = 0;

@implementation UIView (HierarchyExtension)

- (void)recursionView:(UIView *)rootView hierarchy:(NSInteger)index
{
    if (!rootView) {
        return;
    }
    NSLog(@"%@",[self flagsNum:index]);
    for (UIView *view in rootView.subviews) {
        NSLog(@"%@",NSStringFromClass([rootView Class]));
        [self recursionView:view hierarchy:index + 1];
    }
    
}

- (NSString *)flagsNum:(NSInteger)num
{
    NSString *flag = @"";
    NSInteger i = 0;
    while (i < num) {
        flag = [NSString stringWithFormat:@"%@-",flag];
        ++i;
    }
    return flag;
}
@end
