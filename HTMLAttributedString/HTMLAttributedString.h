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
	NSString *_text;
}

- (id)initWithText:(NSString *)text withFont:(UIFont *)font;
+ (NSAttributedString *)stringWithText:(NSString *)text andFont:(UIFont *)font;

@property (nonatomic, readonly) NSArray *cssAttributes;
@property (nonatomic, readonly) NSAttributedString *text;

- (void)addCssAttribute:(NSString *)cssAttribute;
- (void)removeCssAttribute:(NSString *)cssAttribute;
- (void)clear;

@end
