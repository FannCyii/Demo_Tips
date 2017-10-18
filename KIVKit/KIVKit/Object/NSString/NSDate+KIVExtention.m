//
//  NSDate+KIVExtention.m
//  KIVKit
//
//  Created by kivan on 27/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "NSDate+KIVExtention.h"

@implementation NSDate (KIVExtention)

+ (NSDictionary *)convertToDictionaryFromString:(NSString *)originStr
{
    //注意 originStr必须是@"{\"key\":\"value\"}\"
    if (originStr.length == 0) {
        return nil;
    }
    
}

@end
