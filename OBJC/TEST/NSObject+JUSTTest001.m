//
//  NSObject+JUSTTest001.m
//  OBJC
//
//  Created by chengqifan on 26/04/2017.
//  Copyright © 2017 cqf. All rights reserved.
//

#import "NSObject+JUSTTest001.h"

@implementation NSObject (JUSTTest001)

+ (void)load{
    //NSLog(@"=====");
}

- (void)ObjectTest001
{
    NSLog(@"ObjectTest001");
}
- (void)ObjectTest002
{
    NSLog(@"ObjectTest002");
}
@end

__attribute__((__used__)) static void importNeedFiles ()
{
    //import_TestFile();
    //more ...
}
