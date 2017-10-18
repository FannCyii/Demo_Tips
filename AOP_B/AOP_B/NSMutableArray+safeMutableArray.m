//
//  NSMutableArray+safeMutableArray.m
//  AOP_B
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "NSMutableArray+safeMutableArray.h"
#import <objc/runtime.h>

@implementation NSMutableArray (safeMutableArray)

+(void)load
{
    //[self swizzleMethod:@selector(addObject:) withCurrentMethod:@selector(safeAddObject:)];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originSelector = @selector(addObject:);
        SEL currentSelector = @selector(safeAddObject:);
        
        Class selfClass = [self class];
        Method oriMethod = class_getInstanceMethod(selfClass, originSelector);
        Method cusMethod = class_getInstanceMethod(selfClass, currentSelector);
        
        BOOL addSucc = class_addMethod(selfClass, originSelector, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSucc) {
            class_replaceMethod(selfClass, currentSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
    
    
}

- (void)safeAddObject:(id)object
{
    NSLog(@"aaaaaaaaaa");
}

+ (void)swizzleMethod:(SEL)originSelector withCurrentMethod:(SEL)currentSelector{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class selfClass = [self class];
        Method oriMethod = class_getInstanceMethod(selfClass, originSelector);
        Method cusMethod = class_getInstanceMethod(selfClass, currentSelector);
        
        BOOL addSucc = class_addMethod(selfClass, originSelector, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSucc) {
            class_replaceMethod(selfClass, currentSelector, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        }else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
   });
}





@end
