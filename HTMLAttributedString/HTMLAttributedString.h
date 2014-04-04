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

- (id)initWithText:(NSString *)text withBodyFont:(UIFont *)font;
+ (NSAttributedString *)stringWithText:(NSString *)text andBodyFont:(UIFont *)font;

@property (nonatomic, readonly) NSArray *cssAttributes;
@property (nonatomic, readonly) NSAttributedString *attributedText;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *bodyFont;

- (void)addCssAttribute:(NSString *)cssAttribute;
- (void)removeCssAttribute:(NSString *)cssAttribute;
- (void)clear;

@end
