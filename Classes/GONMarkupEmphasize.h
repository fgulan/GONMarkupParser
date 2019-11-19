//
//  GONMarkupEmphasize.h
//  GONMarkupParser
//
//  Created by Filip Gulan on 19/11/2019.
//

#import "GONMarkupFontTraits.h"

#define GONMarkupEmphasize_TAG                 @"em"

@interface GONMarkupEmphasize : GONMarkupFontTraits

+ (instancetype)emphasizeMarkup;

@end
