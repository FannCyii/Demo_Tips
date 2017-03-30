//
//  UIView+GradientColor.h
//  View_Gradient
//
//  Created by chengqifan on 29/03/2017.
//  Copyright © 2017 yhd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,GradientOrientation){
    GradientToUp,
    GradientToDown,
    GradientToLeft,
    GradientToRight
};

@interface UIView (GradientColor)
- (void)gradientColorWithStarHex:(NSInteger)startHex endHex:(NSInteger)endHex;

- (void)gradientColorWithStarHex:(NSInteger)startHex endHex:(NSInteger)endHex Orientation:(GradientOrientation)orientation;
@end
