//
//  NSDate+KIVExtention.h
//  KIVKit
//
//  Created by kivan on 27/05/2017.
//  Copyright © 2017 kivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KIVExtention)

///compare
- (BOOL)isGreaterThanDate:(NSDate *)rightDate;
- (BOOL)islesserThanDate:(NSDate *)rightDate;

///convert
//- toString
- (NSString *)toStringWithFormat:(NSString *)formatStr;
- (NSString *)toStringYYYY_MM_DD;
- (NSString *)toStringYyyy_MM_dd_HHmmss;
//- String to Date
+ (NSDate *)dateConvertFromString:(NSString *)dateStr withFormat:(NSString *)formatStr;

@end
