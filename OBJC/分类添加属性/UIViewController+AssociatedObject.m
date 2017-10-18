//
//  UIViewController+AssociatedObject.m
//  OBJC
//
//  Created by chengqifan on 07/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "UIViewController+AssociatedObject.h"
#import <objc/runtime.h>

@implementation UIViewController (AssociatedObject)



/**
 获取关联对象
 id objc_getAssociatedObject(id object, const void *key)
 object : 获取关联对象的对象, id类型
 key : 关联对象的key, const void *类型,这里直接将当前方法地址作为关联对象的key
 */
- (NSString *)associatedStrong
{
    return objc_getAssociatedObject(self, _cmd);
}

/**
 设置关联对象
 void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
 object : 需要设置关联对象的对象, id类型
 key : 关联对象的key, const void *类型 (这里直接使用associatedStrong方法的地址作为关联key值)
 value : 关联对象的值, id类型
 policy : 关联对象的策略, objc_AssociationPolicy类型
 */
- (void)setAssociatedStrong:(NSString *)newAssociatedStrong
{
    return objc_setAssociatedObject(self, @selector(associatedStrong), newAssociatedStrong, OBJC_ASSOCIATION_RETAIN);
}

@end
