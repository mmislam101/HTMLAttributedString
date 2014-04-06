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

- (id)initWithHtml:(NSString *)html andBodyFont:(UIFont *)font
{
	if (!(self = [super init]))
        return self;

	_cssAttributes	= [[NSMutableArray alloc] init];
	_html			= html;
	_bodyFont		= font;
	_bodyFontCss	= [NSString stringWithFormat:@"body{font-family : '%@'; font-size : %fpx;}", font.familyName, font.pointSize];

	[self addCssAttribute:_bodyFontCss];

    return self;
}

+ (NSAttributedString *)attributedStringWithHtml:(NSString *)html andBodyFont:(UIFont *)font
{
	HTMLAttributedString *htmlAttributedString = [[HTMLAttributedString alloc] initWithHtml:html andBodyFont:font];

	return htmlAttributedString.attributedString;
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

- (void)clearCssAttributes
{
	[_cssAttributes removeAllObjects];
}

- (NSAttributedString *)attributedString
{
	__block NSString *css		= @"<style>";

	[_cssAttributes enumerateObjectsUsingBlock:^(NSString *cssAttribute, NSUInteger idx, BOOL *stop) {
		css = [css stringByAppendingString:cssAttribute];
	}];

	css							= [css stringByAppendingString:@"</style>"];
	NSString *htmlBody			= [_html stringByAppendingString:css];

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
