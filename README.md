TJFoundation aims to extend Core Foundation by providing base classes and extending core classes with useful features that most iOS project would need.

# Installation

**TJFoundation is a work in progress, and has not been thoroughly tested. Use at you own risks.**

1. <a href="https://github.com/thomasjoulin/TJFoundation/downloads">Download the latest version of `TJFoundation.framework`</a> or check this directory out to build from source (see below).
2. Drag and drop `TJFoundation.framework` into you project (I suggest in the `Frameworks` group). Make sure to copy it.
3. Add `<Path To TJFoundation.framework>/Headers` in the `Header Search Paths` of your target `Build Settings`.
4. Add `#import <TJFoundation.h>` wherever you need it. I suggest to make it global by adding it to your `Prefix.pch`.

## Build from sources

1. Checkout this directory an open `TJFramework.xcodeproj`
2. Select the `TJFoundation Universal Framework` scheme
3. Build
4. A Finder window should open with the framework. Otherwise, it's in the Products directory

# Example

See the headers for full listing. The content (classes, methods and documentation) will improve over time. Please make pull request if you have any useful methods to add or a fix.

## NSString

	- (BOOL)isValidEmail;

Returns TRUE if the email is valid, FALSE otherwise

	+ (NSString *)stringFromBool;

Converts a BOOL to a readable NSString.

	NSString	*valid = @"email@example.com";
	NSString	*invalid = @"email.com";

	NSLog(@"%@ is valid ? %@", valid, [NSString stringFromBool:[valid isValidEmail]]);
	// email@example.com is valid ? TRUE
	
	NSLog(@"%@ is valid ? %@", invalid, [NSString stringFromBool:[invalid isValidEmail]]);
	// email.com is valid ? FALSE

## NSDate

	- (NSString *)stringWithFormat:(NSString *)format;
	
Returns the string value of an NSDate with the specific format. Example :

	NSDate 		*date = [NSDate date];
	NSString	*formatted_date = [date stringWithFormat:@"dd/MM/yy"];
	
	NSLog(@"%@", formatted_date);
	// 09/01/12

# TODO

1. `Example.xcodeproj` using the framework
2. Improve documentation (and screenshots detailing installation)
3. Add unit tests
4. Improve framework
5. ...
6. Profit !

That's it for now !