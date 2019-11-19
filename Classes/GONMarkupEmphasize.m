//
//  GONMarkupEmphasize.m
//  GONMarkupParser
//
//  Created by Filip Gulan on 19/11/2019.
//

#import "GONMarkupEmphasize.h"

@implementation GONMarkupEmphasize

+ (instancetype)emphasizeMarkup
{
    return [self fontTraitsMarkup:GONMarkupEmphasize_TAG traits:UIFontDescriptorTraitItalic];
}

@end
