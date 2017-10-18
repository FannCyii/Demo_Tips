//
//  TestObject.h
//  TranslationAnimation
//
//  Created by chengqifan on 18/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  泛型声明
 *  泛型，在.h文件中申明泛型所对应的类型符号，在类名后面，“:”前面添加<ObjectType>，方法申明都可以使用该符号。但是在.m文件中要使用id类型来代替。
 *  注意：不要把抽象接口和泛型搞混了。抽象接口是protocol的一种使用，当数组中类型指定为改抽象接口时，该数组中必须存储遵循改接口的对象，这个就需要额外声明抽象接口的protocol。而泛型不需要额外声明直接在类定义时就已经设定好了。
 */
@interface TestObject <ObjectType> : NSObject
- (ObjectType)testaaaa:(ObjectType)testobjec;

@end
