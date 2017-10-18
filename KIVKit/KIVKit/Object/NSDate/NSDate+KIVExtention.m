//
//  NSDate+KIVExtention.m
//  KIVKit
//
//  Created by kivan on 27/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import "NSDate+KIVExtention.h"

@implementation NSDate (KIVExtention)


#pragma mark - Compare
//比XX大
- (BOOL)isGreaterThanDate:(NSDate *)rightDate
{
    return [self laterDate:rightDate] == self;
}

//比XX小
- (BOOL)islesserThanDate:(NSDate *)rightDate
{
    return [self earlierDate:rightDate] == self;
}

#pragma mark - Convert

//- ConverToString
- (NSString *)toStringYYYY_MM_DD
{
    return [self toStringWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)toStringYyyy_MM_dd_HHmmss
{
    return [self toStringWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)toStringWithFormat:(NSString *)formatStr
{
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone localTimeZone];
    formater.dateStyle = formatStr;
    NSString *dateString = [formater stringFromDate:self];
    return dateString;
}

//- String to Date
+ (NSDate *)dateConvertFromString:(NSString *)dateStr withFormat:(NSString *)formatStr
{
    if (!str) {
        return nil;
    }
    NSDateFormatter * formater = [[NSDateFormatter alloc] init];
    formater.timeZone = [NSTimeZone localTimeZone];
    formater.dateStyle = formatStr;
    NSDate *date = [formater dateFromString:dateStr];
    return date;
}


@end
