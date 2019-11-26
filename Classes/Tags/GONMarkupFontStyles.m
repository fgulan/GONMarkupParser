//
//  GONMarkupBig.m
//  GONMarkupParser
//
//  Created by Filip Gulan on 26/11/2019.
//

#import "GONMarkupFontStyles.h"

@interface GONMarkupFontStyles ()

@property (nonatomic, assign) CGFloat fontScale;

@end

@implementation GONMarkupFontStyles

+ (instancetype)bigMarkup
{
    return [[GONMarkupFontStyles alloc] initWithFontScale:1.15 tag:GONMarkupBig_TAG];
}

+ (instancetype)smallMarkup
{
    return [[GONMarkupFontStyles alloc] initWithFontScale:0.9 tag:GONMarkupSmall_TAG];
}

- (instancetype)initWithFontScale:(CGFloat)fontScale tag:(NSString *)tag
{
    self = [super initWithTag:tag];
    if (self) {
        _fontScale = fontScale;
    }
    return self;
}

- (void)openingMarkupFound:(NSString *)tag
             configuration:(NSMutableDictionary *)configurationDictionary
                   context:(NSMutableDictionary *)context
                attributes:(NSDictionary *)dicAttributes
              resultString:(NSAttributedString *)resultString
{
    // Look for current font
    UIFont *currentFont = [configurationDictionary objectForKey:NSFontAttributeName];
    if (!currentFont)
    {
        // No found defined, use default one with default size
        currentFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    
    CGFloat newSize = currentFont.pointSize * self.fontScale;
    newSize = self.fontScale < 1 ? floorf(newSize) : ceilf(newSize);

    UIFont *updatedFont = [UIFont fontWithDescriptor:currentFont.fontDescriptor
                                                size:newSize];

    // Update configuration
    [configurationDictionary setObject:updatedFont
                                 forKey:NSFontAttributeName];
}

@end
