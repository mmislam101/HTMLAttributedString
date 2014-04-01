//
//  HTMLAttributedString.m
//  HTMLAttributedStringExample
//
//  Created by Mohammed Islam on 3/31/14.
//  Copyright (c) 2014 KSI Technology. All rights reserved.
//

#import "HTMLAttributedString.h"

@implementation HTMLAttributedString

@synthesize
cssAttributes = _cssAttributes;

- (id)initWithText:(NSString *)text withFont:(UIFont *)font
{
	if (!(self = [super init]))
        return self;

	_cssAttributes	= [[NSMutableArray alloc] init];
	_text			= text;

	[self addCssAttribute:[NSString stringWithFormat:@"body{font-family : '%@'; font-size : %fpx;}", font.familyName, font.pointSize]];

    return self;
}

+ (NSAttributedString *)stringWithText:(NSString *)text andFont:(UIFont *)font
{
	HTMLAttributedString *htmlAttributedString = [[HTMLAttributedString alloc] initWithText:text withFont:font];

	return htmlAttributedString.text;
}

- (void)addCssAttribute:(NSString *)cssAttribute
{
	[_cssAttributes addObject:cssAttribute];
}

- (void)removeCssAttribute:(NSString *)cssAttribute
{
	[_cssAttributes removeObject:cssAttribute];
}

- (void)clear
{
	[_cssAttributes removeAllObjects];
}

- (NSAttributedString *)text
{
	__block NSString *css		= @"<style>";

	[_cssAttributes enumerateObjectsUsingBlock:^(NSString *cssAttribute, NSUInteger idx, BOOL *stop) {
		css = [css stringByAppendingString:cssAttribute];
	}];

	css							= [css stringByAppendingString:@"</style>"];
	NSString *htmlBody			= [_text stringByAppendingString:css];

	NSStringEncoding encoding	= NSUnicodeStringEncoding;
	NSData *data				= [htmlBody dataUsingEncoding:encoding];

	NSDictionary *options		= @{NSDocumentTypeDocumentAttribute			: NSHTMLTextDocumentType,
									NSCharacterEncodingDocumentAttribute	: @(encoding)};

	NSAttributedString *body	= [[NSAttributedString alloc] initWithData:data
																options:options
													 documentAttributes:nil
																  error:nil];

	return body;
}

@end
