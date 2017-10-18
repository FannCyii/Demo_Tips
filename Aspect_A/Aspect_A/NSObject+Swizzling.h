//
//  NSObject+Swizzling.h
//  Aspect_A
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+ (void)swizzleMethod:(SEL)originSelector withCurrentMethod:(SEL)currentMethod;
@end
