//
//  UIView+KIVViewGeometry.m
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "UIView+KIVViewGeometry.h"

@implementation UIView (KIVViewGeometry)

+ (CGRect)mainScreenBounds
{
    return [UIScreen mainScreen].bounds;
}

+ (CGRect)CGRectMakeWith:(CGPoint)origin size:(CGSize)size
{
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

- (void)setFrameWith:(CGPoint)origin size:(CGSize)size
{
    self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
}

#pragma mark - ViewGeometry Property Accesser
#pragma mark - getter
- (CGPoint)viewOrigin
{
    return self.frame.origin;
}
- (CGSize)viewSize
{
    return self.frame.size;
}
- (CGFloat)originX
{
    return self.frame.origin.x;
}
- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (CGFloat)sizeWidth
{
    return self.frame.size.width;
}

- (CGFloat)sizeHeight
{
    return self.frame.size.height;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)centerY
{
    return self.center.y;
}

#pragma mark - setter
- (void)setViewOrigin:(CGPoint)viewOrigin
{
    [self setFrameWith:viewOrigin size:self.frame.size];
}

- (void)setViewSize:(CGSize)viewSize
{
    [self setFrameWith:self.frame.origin size:viewSize];
}

- (void)setOriginX:(CGFloat)originX
{
    self.frame = CGRectMake(originX, self.originY, self.sizeWidth, self.sizeHeight);
}

- (void)setOriginY:(CGFloat)originY
{
    self.frame = CGRectMake(self.originX, originY, self.sizeWidth, self.sizeHeight);
}

- (void)setSizeWidth:(CGFloat)sizeWidth
{
    self.frame = CGRectMake(self.originX, self.originY, sizeWidth, self.sizeHeight);
}

- (void)setSizeHeight:(CGFloat)sizeHeight
{
    self.frame = CGRectMake(self.originX, self.originY, self.sizeWidth, sizeHeight);
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.centerY);
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.centerX, centerY);
}


@end
