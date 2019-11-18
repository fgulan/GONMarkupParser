//
//  NSString+Helper.m
//  GONMarkupParser
//
//  Created by Filip Gulan on 18/11/2019.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

- (NSString *)stringByTrimmingLeadingSpace
{
   return [self stringByTrimmingLeadingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
}

 - (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet
{
   NSRange rangeOfFirstWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]];
   if (rangeOfFirstWantedCharacter.location == NSNotFound) {
       return @"";
   }
   return [self substringFromIndex:rangeOfFirstWantedCharacter.location];
}

@end
