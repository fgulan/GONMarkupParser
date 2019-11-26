//
//  GONMarkupHeader.h
//  GONMarkupParserSample
//
//  Created by Filip Gulan on 19/11/2019.
//  Copyright © 2019 Nicolas Goutaland. All rights reserved.
//

#import "GONMarkup.h"

// Tag
#define GONMarkupHeaderPrefix_TAG                 @"h"

@interface GONMarkupHeader : GONMarkup

+ (instancetype)paragraphMarkupForLevel:(NSInteger)level;

@end
