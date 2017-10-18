//
//  NSObject+KIVObjectExtention.h
//  OBJC
//
//  Created by chengqifan on 26/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef struct {
    Ivar *varlist;
    unsigned int outCount;
}kiv_Vars;


@interface NSObject (KIVObjectExtention)
/**
 *  变量
 *
 *  获取所有oc变量名称,无法获取关联对象变量名
 */
- (NSArray *)kiv_getAllObjcVarsName;

//根据名称获取变量
- (Ivar)kiv_getIVarWithName:(NSString *)varName;
//获取变量类型, 只针对非基础型变量
- (Class)kiv_getIVarClassWithName:(NSString *)varName;
//根据变量名获取变量值,可获取私有变量值
- (id)kiv_valueWithIVarName:(NSString *)varName;


/**
 *  属性
 *
 */
//获取所有oc属性名称，可以获取关联属性
- (NSArray *)kiv_getAllPropertyName;
//无法获取关联属性
+ (NSArray *)kiv_getAllClassPropertyName;





@end
