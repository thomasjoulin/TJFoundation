TJFoundation aims to extend Core Foundation by providing base classes and extending core classes with useful features that most iOS project would need.

# Installation

**TJFoundation is a work in progress, and has not been thoroughly tested. Use at you own risks.**

1. You can <a href="https://github.com/thomasjoulin/TJFoundation/downloads">download the ready-made framework</a> or build from source. If you don't want to build from source, skip the following steps and go directly to step 2.
1.1 Checkout this directory an open `TJFramework.xcodeproj`
1.2 Select the `MakeFramework` scheme
1.3 Build
1.4 A Finder window should open with the framework. Otherwise, it's in the Products directory
2. Drag and drop `TJFoundation.framework` into you project (I suggest in the `Frameworks` group).
3. Drag and drop `TJFoundationResources.bundle` into your project (I suggest in the `Resources` folder)
4. Add `#import <TJFoundation/TJFoundation.h>` wherever you need it. I suggest to make it global by adding it to your `Prefix.pch`.
5. In your project Build Settings, Other Linker Flags, add `-ObjC`.
6. In your project Build Phases, Link Binary With Libraries, Add :
- libz.dlyb
- MapKit.framework
- QuartzCore.framework

# Example

See the headers for full listing. The content (classes, methods and documentation) will improve over time. Please make pull request if you have any useful methods to add or a fix.

## Pull to Refresh

Create a `TJTableViewController` subclass (which is a `UITableViewController` subclass, so you can use it exactly like it). In your `init` method, you need to set the `refreshControl` property :

    - (id)init
    {
        if ((self = [super init]))
        {        
            self.refreshControl = [[TJRefreshControl alloc] init];
        
            [self.refreshControl addTarget:self action:@selector(didRefresh) forControlEvents:UIControlEventValueChanged];
        }
    
        return self;
    }

`TJRefreshControl` maps the public header of `UIRefreshControl`, present in iOS6. It's a `UIControl` subclass, so you can add yourself as a target for `UIControlEventValueChanged` events. Use `TJRefreshControl` as a direct replacement of `UIRefreshControl`. It will use the native control on iOS6, a custom one in early versions.

## Network oriented ORM

`TJDataSource` lets you define a URL that will fill your models. Based on some specific naming conventions,
you just need to define `TJModel` subclasses to make it work.

Take a look at `TJFoundationDemo` for examples.

## Categories

### NSString

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

### NSDate

	- (NSString *)stringWithFormat:(NSString *)format;
	
Returns the string value of an NSDate with the specific format. Example :

	NSDate 		*date = [NSDate date];
	NSString	*formatted_date = [date stringWithFormat:@"dd/MM/yy"];
	
	NSLog(@"%@", formatted_date);
	// 09/01/12
