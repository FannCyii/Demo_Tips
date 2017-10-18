//
//  NSMutableArray+SafeArray.m
//  Aspect_A
//
//  Created by chengqifan on 03/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "NSMutableArray+SafeArray.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (SafeArray)

+ (void)load
{
    [self swizzleMethod:@selector(addObject:) withCurrentMethod:@selector(safeAddObject:)];
    
//    Class selfClass = [self class];
//    
//    SEL oriSEL1 = @selector(addObject:);
//    Method oriMethod1 = class_getInstanceMethod(selfClass, oriSEL1);
//    
//    SEL cusSEL1 = @selector(safeAddObject:);
//    Method cusMethod1 = class_getInstanceMethod(selfClass, cusSEL1);
//    
//    BOOL addSucc1 = class_addMethod(selfClass, oriSEL1, method_getImplementation(cusMethod1), method_getTypeEncoding(cusMethod1));
//    if (addSucc1) {
//        class_replaceMethod(selfClass, cusSEL1, method_getImplementation(oriMethod1), method_getTypeEncoding(oriMethod1));
//    }else {
//        method_exchangeImplementations(oriMethod1, cusMethod1);
//    }

    //[self swizzleMethod:@selector(insertObject:atIndex:) withCurrentMethod:@selector(safeInsertObject:atIndex:)];
    
}

- (void)safeAddObject:(id)object
{
    if (object == nil){
        return;
    }
    [self safeAddObject:object];
    NSLog(@"safe nsarray addobject:");
}

- (void)safeInsertObject:(id)anObject
                 atIndex:(NSUInteger)index {
    //do safe operate
    if (anObject && index <= self.count) {
        [self safeInsertObject:anObject atIndex:index];
    } else {
        NSLog(@"safeInsertObject:atIndex: anObject or index is invalid");
    }
}


@end
