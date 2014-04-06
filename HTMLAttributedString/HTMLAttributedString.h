//
//  HTMLAttributedString.h
//  HTMLAttributedStringExample
//
//  Created by Mohammed Islam on 3/31/14.
//  Copyright (c) 2014 KSI Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTMLAttributedString : NSObject
{
	NSMutableArray *_cssAttributes;
	NSString *_bodyFontCss;
}

- (id)initWithHtml:(NSString *)html andBodyFont:(UIFont *)font;
+ (NSAttributedString *)attributedStringWithHtml:(NSString *)html andBodyFont:(UIFont *)font;

@property (nonatomic, readonly) NSArray *cssAttributes;
@property (nonatomic, readonly) NSAttributedString *attributedString;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) UIFont *bodyFont;

- (void)addCssAttribute:(NSString *)cssAttribute;
- (void)removeCssAttribute:(NSString *)cssAttribute;
- (void)clearCssAttributes;

@end
