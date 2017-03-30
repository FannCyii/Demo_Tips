//
//  UIView+GradientColor.m
//  View_Gradient
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import "UIView+GradientColor.h"

@implementation UIView (GradientColor)


- (void)gradientColorWithStarHex:(NSInteger)startHex endHex:(NSInteger)endHex
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    //[self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
    //set gradient colors
    gradientLayer.colors = @[(__bridge id)[self hexToUIColor:startHex].CGColor, (__bridge id) [self hexToUIColor:endHex].CGColor];
    //set locations
    gradientLayer.locations = @[@0, @1];
    //gradientLayer.opacity = 0.5;
    //set gradient start and end points
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
}

- (UIColor *)hexToUIColor:(NSInteger)rgbValue
{
    //    CGFloat red   = (hexValue & 0xff >> 16)/255.0;
    //    CGFloat green = (hexValue & 0xff >> 8 ) /255.0;
    //    CGFloat blue  = (hexValue & 0xff)/255.0;
    //    CGFloat alpha = (hexValue & 0xff >> 24)/255.0;
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                           green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                            blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                           alpha:1.0];
}

@end
