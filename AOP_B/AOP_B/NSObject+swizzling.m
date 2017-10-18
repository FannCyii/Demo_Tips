//
//  NSObject+swizzling.m
//  AOP_B
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "NSObject+swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (swizzling)

+ (void)swizzleMethod:(SEL)originSelector withCurrentMethod:(SEL)currentMethod{
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    Class selfClass = [self class];
    Method oriMethod = class_getInstanceMethod(selfClass, originSelector);
    Method cusMethod = class_getInstanceMethod(selfClass, currentMethod);
    
    BOOL addSucc = class_addMethod(selfClass, originSelector, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
    if (addSucc) {
        class_replaceMethod(selfClass, currentMethod, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    }else {
        method_exchangeImplementations(oriMethod, cusMethod);
    }
    //    });
}


@end
