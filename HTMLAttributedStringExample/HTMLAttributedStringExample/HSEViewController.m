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

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation HSEViewController

- (void)loadView
{
	[super loadView];

	HTMLAttributedString *string = [[HTMLAttributedString alloc] initWithText:@"<center><h1>THIS</h1></center><p>Is <i>one</i> string from only <b><i>two</b></i> lines of code. <h2>Can you believe it?</h2>" withFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
	[string addCssAttribute:@"h2{font-family : 'Avenir-Roman'; font-size : 24px;}"];

	self.label.attributedText = string.text;
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
