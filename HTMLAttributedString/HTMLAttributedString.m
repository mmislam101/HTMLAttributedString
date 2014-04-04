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

- (id)initWithText:(NSString *)text withBodyFont:(UIFont *)font
{
	if (!(self = [super init]))
        return self;

	_cssAttributes	= [[NSMutableArray alloc] init];
	_text			= text;
	_bodyFont		= font;
	_bodyFontCss	= [NSString stringWithFormat:@"body{font-family : '%@'; font-size : %fpx;}", font.familyName, font.pointSize];

	[self addCssAttribute:_bodyFontCss];

    return self;
}

+ (NSAttributedString *)stringWithText:(NSString *)text andBodyFont:(UIFont *)font
{
	HTMLAttributedString *htmlAttributedString = [[HTMLAttributedString alloc] initWithText:text withBodyFont:font];

	return htmlAttributedString.attributedText;
}

- (void)setBodyFont:(UIFont *)bodyFont
{
	_bodyFont					= bodyFont;
	NSString *newBodyFontCss	= [NSString stringWithFormat:@"body{font-family : '%@'; font-size : %fpx;}", bodyFont.familyName, bodyFont.pointSize];
	[_cssAttributes replaceObjectAtIndex:[_cssAttributes indexOfObject:_bodyFontCss] withObject:newBodyFontCss];
	_bodyFontCss	= newBodyFontCss;

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

- (NSAttributedString *)attributedText
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
