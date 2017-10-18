//
//  NSObject+KIVObjectExtention.m
//  OBJC
//
//  Created by chengqifan on 26/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "NSObject+KIVObjectExtention.h"

@implementation NSObject (KIVObjectExtention)

- (void)kiv_getAllInstenceFunctionName
{

}

- (void)kiv_getAllClassFunctionName
{

}

+ (NSArray *)kiv_getAllClassPropertyName
{
    return [self kiv_getAllObjcVarsName];
}

- (NSArray *)kiv_getAllPropertyName
{
    unsigned int outCount = 0;
    objc_property_t *objcPropertyList = class_copyPropertyList([self class], &outCount);
    NSMutableArray *propertys = [NSMutableArray array];
    for (int i = 0; i < outCount; ++i) {
        objc_property_t iProperty = objcPropertyList[i];
        NSString *propertyName =  [NSString stringWithCString:property_getName(iProperty) encoding:NSUTF8StringEncoding];
        [propertys addObject:propertyName];
    }
    return propertys;
}

- (kiv_Vars)kiv_getAllVars
{
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    
    kiv_Vars kvars = {  .varlist = ivars,
                        .outCount = outCount
                     };
    return kvars;
}

#pragma mark - 变量

- (NSArray *)kiv_getAllObjcVarsName
{
    kiv_Vars varL = [self kiv_getAllVars];
    NSMutableArray * ocVars = [NSMutableArray array];
    
    for (int i = 0; i < varL.outCount; ++i) {
        Ivar iVar = varL.varlist[i];
        NSString *iVarName = [self kiv_ObjcVarToString:iVar];
        if (iVarName == nil){
            continue;
        }
        [ocVars addObject:iVarName];
    }
    return ocVars;
}

- (Ivar)kiv_getIVarWithName:(NSString *)varName
{
    kiv_Vars varL = [self kiv_getAllVars];
    for (int i = 0; i < varL.outCount; ++i) {
        Ivar iVar = varL.varlist[i];
        NSString *iVarName = [self kiv_ObjcVarToString:iVar];
        if (iVarName == nil){
            continue;
        }
        if ([iVarName isEqualToString:varName]){
            return iVar;
        }
    }
    return nil;
}

- (BOOL)kiv_isObjcVar:(Ivar)ivar
{
    const char *type = ivar_getTypeEncoding(ivar);
    NSString *stringType = [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
    if (![stringType hasPrefix:@"@"]) {
        return NO;
    }
    return YES;
}

- (NSString *)kiv_ObjcVarToString:(Ivar)ivar
{
    if (![self kiv_isObjcVar:ivar]){
        return nil;
    }
    return [NSString stringWithUTF8String:ivar_getName(ivar)];
}

- (Class)kiv_getIVarClassWithName:(NSString *)varName
{
    return [[self kiv_valueWithIVarName:varName] class];
}
//根据变量名获取变量值
- (id)kiv_valueWithIVarName:(NSString *)varName
{
    Ivar ivar = [self kiv_getIVarWithName:varName];
    id instance = object_getIvar(self, ivar);
    if (instance == nil){
        NSLog(@"the var:‘%@’ dosn't initialize!",varName);
    }
    return instance;
}


@end
