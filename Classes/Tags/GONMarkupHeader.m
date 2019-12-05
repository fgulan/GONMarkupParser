//
//  GONMarkupHeader.m
//  GONMarkupParserSample
//
//  Created by Filip Gulan on 19/11/2019.
//  Copyright © 2019 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkupHeader.h"

@interface GONMarkupHeader ()

@property (nonatomic, assign) NSInteger level;

@end

@implementation GONMarkupHeader

+ (instancetype)paragraphMarkupForLevel:(NSInteger)level
{
    GONMarkupHeader *header = [self markupForTag:[GONMarkupHeaderPrefix_TAG stringByAppendingFormat:@"%ld", (long)level]];
    header.level = level;
    return header;
}

- (NSAttributedString *)prefixStringForContext:(NSMutableDictionary *)context
                                    attributes:(NSDictionary *)dicAttributes
                              stringAttributes:(NSDictionary *)stringAttributes
                                  resultString:(NSAttributedString *)resultString
{
    NSString *prefix = @"";
    // Check for previous newline
    if (resultString.string.length > 0) {
        // If last char isn't a new line, add a new line
        if (![[NSCharacterSet newlineCharacterSet] characterIsMember:[resultString.string characterAtIndex:resultString.string.length - 1]]) {
            prefix = @"\n";
        }
    }
    
    return [[NSAttributedString alloc] initWithString:prefix attributes:stringAttributes];
}

- (void)openingMarkupFound:(NSString *)tag
             configuration:(NSMutableDictionary *)configurationDictionary
                   context:(NSMutableDictionary *)context
                attributes:(NSDictionary *)dicAttributes
              resultString:(NSAttributedString *)resultString
{
    NSMutableParagraphStyle *style = [[configurationDictionary objectForKey:NSParagraphStyleAttributeName] mutableCopy];
    if (!style) {
        style = [[NSMutableParagraphStyle alloc] init];
    }
    CGFloat fontSize = [self fontSizeForSizeValue:self.level];
    style.paragraphSpacingBefore = [self lineSpacingForFontSize:fontSize sizeValue:self.level];
    
    [configurationDictionary setObject:style
                                forKey:NSParagraphStyleAttributeName];
    [configurationDictionary setObject:[UIFont systemFontOfSize:fontSize weight:UIFontWeightBold]
                                 forKey:NSFontAttributeName];
}

- (CGFloat)fontSizeForSizeValue:(NSInteger)sizeValue
{
    switch (sizeValue) {
        case 1: return 30.0f;
        case 2: return 23.0f;
        case 3: return 17.0f;
        case 4: return 15.0f;
        case 5: return 12.0f;
        case 6: return 11.0f;
        default: return sizeValue > 6 ? 32.0f : 10.0f;
    }
}

- (CGFloat)lineSpacingForFontSize:(CGFloat)fontSize sizeValue:(NSInteger)sizeValue
{
    switch (sizeValue) {
        case 1: return 0.66 * fontSize;
        case 2: return 0.86 * fontSize;
        case 3: return 1.18 * fontSize;
        case 4: return 1.44 * fontSize;
        case 5: return 1.76 * fontSize;
        case 6: return 2.42 * fontSize;
        default: return sizeValue > 6 ? 0.67 * fontSize : 2.33 * fontSize;
    }
}

@end
