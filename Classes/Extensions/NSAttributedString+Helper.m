//
//  NSAttributedString+Helper.m
//  GONMarkupParser
//
//  Created by Filip Gulan on 18/11/2019.
//

#import "NSAttributedString+Helper.h"

@implementation NSAttributedString (Helper)

- (BOOL)endsWithNewLine
{
   if (self.length <= 0) {
       return NO;
   }
   unichar last = [self.string characterAtIndex:self.length - 1];
   return [[NSCharacterSet newlineCharacterSet] characterIsMember:last];
}

@end
