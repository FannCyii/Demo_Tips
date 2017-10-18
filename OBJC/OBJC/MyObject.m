//
//  MyObject.m
//  OBJC
//
//  Created by chengqifan on 07/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "MyObject.h"
#import <objc/runtime.h>

@interface MyObject()

@property (nonatomic, strong, readwrite)NSString * myAssociatedObject2222;
@property (nonatomic, strong, readwrite)NSString * myAssociatedObject3333;
@property (nonatomic, strong, readwrite)NSString * myAssociatedObject4444;

@end

@implementation MyObject


- (void)setMyAssociatedObject:(NSString *)value
{
    objc_setAssociatedObject(self,@selector(myAssociatedObject),value,OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)myAssociatedObject
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
