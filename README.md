HTMLAttributedString
====================

Don't mess with NSRanges anymore; Mark up your strings for quick attributes.

Imagine what you can now do with push notifications by **bolding** or *italicizing* words in the payload! Or imagine how you can create stylized descriptions and instructions on your `UILabel`s!

![HTMLAttributedString Example](http://mmislam101.github.io/images/HTMLAttributedString_scrnshot01.png)

HTMLAttributedString uses the power of iOS 7.0's `initWithData:options:documentAttributes:error:` to bring you the power of HTML and CSS into your everyday iOS development needs.

If you want to do quick styling on any labels and text that shows up on your iOS app, or be able to pass styling through internet to your application, you can use HTMLAttributedString class to accomplish the deed.

###Setup
Init with: 
```smalltalk
HTMLAttributedString *string  = [[HTMLAttributedString alloc] initWithHtml:@"<h1>Header</h1> Test string." andBodyFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
NSAttributedString *attributedString = string.attributedString;
```
But you can also get a quick string by:
```smalltalk
NSAttributedText *attributedString = [HTMLAttributedString attributedStringWithHtml:@"<h2>Quick Header</h2> Isn't that simple?" andBodyFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
```

###Controls
You can add CSS rules and remove them or clear them using the following:
```smalltalk
- (void)addCssAttribute:(NSString *)cssAttribute;
- (void)removeCssAttribute:(NSString *)cssAttribute;
- (void)clearCssAttributes;
```

Example:
```smalltalk
HTMLAttributedString *string  = [[HTMLAttributedString alloc] initWithHtml:@"<h1>Header</h1> Test string." withFont:[UIFont fontWithName:@"Helvetica" size:18.0]];
[string addCssAttribute:@"h1{font-family : 'Avenir-Roman'; font-size : 24px;}"];
```

And you can change the body font with the property:
```smalltalk
@property (nonatomic, strong) UIFont *bodyFont;
```
##That's it! Enjoy!
