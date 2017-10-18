//
//  UIView+HierarchyExtension.m
//  KeyWindow_A
//
//  Created by kivan on 18/07/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "UIView+HierarchyExtension.h"

@implementation UIView (HierarchyExtension)

- (void)recursionView:(UIView *)rootView hierarchy:(NSInteger)index
{
    if (!rootView) {
        return;
    }
    if ([rootView isKindOfClass:[UICollectionView class]]){
        UICollectionView *visibleVC = (UICollectionView *)rootView;
        for (UICollectionViewCell * cell in visibleVC.visibleCells) {
            NSLog(@"%@",NSStringFromClass([cell class]));
            [self recursionView:cell hierarchy:index + 1];
        }
        return;
    }
    
    
    NSLog(@"%@",[self flagsNum:index]);
    for (UIView *view in rootView.subviews) {
        NSLog(@"%@",NSStringFromClass([view class]));
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
