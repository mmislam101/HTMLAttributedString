HTMLAttributedString
====================

Don't mess with NSRanges anymore; Mark up your strings for quick attributes:

![HTMLAttributedString Example](http://mmislam101.github.io/images/HTMLAttributedString_scrnshot01.png)

###Setup
Init with: 
```smalltalk
HTMLAttributedString *string  = [[HTMLAttributedString alloc] initWithText:@"<h1>Header</h1> Test string." withBodyFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
NSAttributedText *attributedString = string.attributedTex
```
But you can also get a quick string by:
```smalltalk
NSAttributedText *attributedString = [HTMLAttributedString stringWithText:@"<h2>Quick Header</h2> Isn't that simple?" andBodyFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
```

###Controls
You can add CSS rules and remove them or clear them using the following:
```smalltalk
- (void)addCssAttribute:(NSString *)cssAttribute;
- (void)removeCssAttribute:(NSString *)cssAttribute;
- (void)clear;
```

Example:
```smalltalk
HTMLAttributedString *string  = [[HTMLAttributedString alloc] initWithText:@"<h1>Header</h1> Test string." withFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
[string addCssAttribute:@"h1{font-family : 'Avenir-Roman'; font-size : 24px;}"];
```

And you can change the body font with the property:
```smalltalk
@property (nonatomic, strong) UIFont *bodyFont;
```
