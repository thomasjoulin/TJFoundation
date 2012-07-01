//
//  NSString+Extensions.h
//  TJFoundation
//
//  Created by Thomas Joulin on 12/25/11.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

@interface NSString (Extensions)

// Test Strings
- (BOOL)isValidEmail;
- (BOOL)isNeitherNullNorEmpty;
- (BOOL)startsWith:(NSString *)s;
- (BOOL)containsString:(NSString *)aString;

// Convert Strings
+ (NSString *)stringFromBool:(BOOL)boolean;
+ (NSString *)stringWithData:(NSData *)data;

// Work with date strings
- (NSString *)formattedStringUsingFormat:(NSString *)dateFormat;
- (NSDate *)dateValueWithFormat:(NSString *)format;
- (NSDate *)dateValue;

// Manipulate strings
- (NSString *)substringFrom:(NSInteger)a to:(NSInteger)b;
- (NSInteger)indexOf:(NSString *)substring from:(NSInteger)starts;
- (NSString *)trim;

// URL strings
- (NSString *)urlEncode;

@end
