//
//  UIView+KIVViewGeometry.h
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KIVViewGeometry)

//Property
@property(nonatomic) CGSize viewSize;
@property(nonatomic) CGPoint viewOrigin;

@property(nonatomic) CGFloat originX;
@property(nonatomic) CGFloat originY;
@property(nonatomic) CGFloat sizeWidth;
@property(nonatomic) CGFloat sizeHeight;

@property(nonatomic) CGFloat centerX;
@property(nonatomic) CGFloat centerY;

//Maker
+ (CGRect)CGRectMakeWith:(CGPoint)origin size:(CGSize)size;

//Frame
- (void)setFrameWith:(CGPoint)origin size:(CGSize)size;

//main Screen bounds
+ (CGRect)mainScreenBounds;

@end
