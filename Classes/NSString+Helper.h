//
//  NSString+Helper.h
//  GONMarkupParser
//
//  Created by Filip Gulan on 18/11/2019.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Helper)

/**
 Return a copy of this string with trimmed leading space character (not all whitespaces, only standard space)
 @returns A copy of this string with trimmed leading space characters
 */
- (NSString *)stringByTrimmingLeadingSpace;

@end

NS_ASSUME_NONNULL_END
