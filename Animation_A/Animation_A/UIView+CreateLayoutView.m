//
//  UIView+CreateLayoutView.m
//  View_Layout
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "UIView+CreateLayoutView.h"

@implementation UIView (CreateLayoutView)

+ (instancetype)autoLayoutInit
{
    UIView *view = [[self alloc]initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor clearColor];
    return view;
}


@end
