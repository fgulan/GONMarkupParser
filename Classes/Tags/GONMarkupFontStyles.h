//
//  GONMarkupBig.h
//  GONMarkupParser
//
//  Created by Filip Gulan on 26/11/2019.
//

#import "GONMarkupFontTraits.h"

#define GONMarkupBig_TAG                 @"big"
#define GONMarkupSmall_TAG                 @"small"

@interface GONMarkupFontStyles : GONMarkup

+ (instancetype)bigMarkup;
+ (instancetype)smallMarkup;

- (instancetype)initWithFontScale:(CGFloat)fontScale tag:(NSString *)tag;

@end
