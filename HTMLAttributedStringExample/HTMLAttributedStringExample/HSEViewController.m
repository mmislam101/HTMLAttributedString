//
//  HSEViewController.m
//  HTMLAttributedStringExample
//
//  Created by Mohammed Islam on 3/31/14.
//  Copyright (c) 2014 KSI Technology. All rights reserved.
//

#import "HSEViewController.h"
#import "HTMLAttributedString.h"

@interface HSEViewController ()
{
	HTMLAttributedString *_string1;
}

@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;

@end

@implementation HSEViewController

- (void)loadView
{
	[super loadView];

	_string1 = [[HTMLAttributedString alloc] initWithHtml:@"<center><h1>THIS</h1></center><p>Is <i>one</i> string from only <b><i>two</b></i> lines of code" andBodyFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
	[_string1 addCssAttribute:@"h2{font-family : 'Avenir-Roman'; font-size : 24px;}"];

	self.label1.attributedText = _string1.attributedString;

	self.label2.attributedText = [HTMLAttributedString attributedStringWithHtml:@"<h2>And this</h2> Is <i>one</i> string from only <b><i>one</b></i> line of code. <h3>Can you believe it?</h3>" andBodyFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
}

- (IBAction)changeBodyFont:(id)sender
{
	_string1.bodyFont = [UIFont fontWithName:@"Helvetica" size:10.0];
	self.label1.attributedText = _string1.attributedString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
