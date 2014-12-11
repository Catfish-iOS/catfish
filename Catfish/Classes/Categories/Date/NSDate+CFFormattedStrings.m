//
//  NSDate+FormattedStrings.m
//
//  Created by Jairo Junior on 8/29/13.
//  Copyright (c) 2013 Oakley. All rights reserved.
//

#import "NSDate+CFFormattedStrings.h"

#define kSuffixDays @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st"

@implementation NSDate (CFFormattedStrings)

//2014-12-08 16:00:00
- (NSString *)dateToStringWithoutTimeZone
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:self];
}

//June 13th, 2013
- (NSString *)dateWithDaySuffix
{    
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:@"MMMM ., yyyy"];//June 13th, 2013
    
    NSString * prefixDateString = [prefixDateFormatter stringFromDate:self];
    
    return [prefixDateString stringByReplacingOccurrencesOfString:@"." withString:[self dayWithSuffix]];
}

//** Return 1st, 2nd, 3rd...
- (NSString *)dayWithSuffix
{    
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [dayFormatter setDateFormat:@"d."];
    
    NSString * dayFormatterString = [dayFormatter stringFromDate:self];
    NSArray *suffixes = [kSuffixDays componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:[dayFormatterString intValue]];
    
    return [dayFormatterString stringByReplacingOccurrencesOfString:@"." withString:suffix];
}

//June 13, 2013
- (NSString *)dateWithNamesMonth
{
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:@"MMMM d, yyyy"];//June 13, 2013
    
    return [prefixDateFormatter stringFromDate:self];
}

//Dec 2, 2014
- (NSString *)dateWithNamesMonthMediumStyle
{
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:@"MMMM d, yyyy"];//Dec 2, 2014
    [prefixDateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    return [prefixDateFormatter stringFromDate:self];
}

//12:01 PM
- (NSString *)hourWithMinutes
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"h:mm a"];
    return [format stringFromDate:self];
}

@end
