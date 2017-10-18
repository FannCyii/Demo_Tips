//
//  NSObject+swizzling.h
//  AOP_B
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (swizzling)

+ (void)swizzleMethod:(SEL)originSelector withCurrentMethod:(SEL)currentMethod;

@end
