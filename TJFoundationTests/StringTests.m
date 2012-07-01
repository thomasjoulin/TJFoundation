//
//  StringTests.m
//  Tournytt
//
//  Created by Thomas Joulin on 5/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "StringTests.h"

@implementation StringTests

- (void)testIsValidEmail
{
    STAssertTrue([@"thomas@joulin.eu" isValidEmail], nil);
    STAssertFalse([@"thomas" isValidEmail], nil);
}

- (void)testIsNeitherNullNorEmpty
{
    NSString *nullString = nil;
    
    STAssertFalse([@"" isNotEmpty], nil);
    STAssertFalse([nullString isNotEmpty], nil);
    STAssertTrue([@"toto" isNotEmpty], nil);
}

- (void)testContainsString
{
    STAssertTrue([@"mitotomi" containsString:@"toto"], nil);
    STAssertFalse([@"mitotomi" containsString:@"mimi"], nil);
}

- (void)testIsUppercase
{
    STAssertTrue([@"GUID" isUppercase], nil);
    STAssertFalse([@"Guid" isUppercase], nil);
}

// Manipulate strings
- (void)testSubstring
{
    STAssertEqualObjects([@"mitotomi" substringFrom:2 to:6], @"toto", nil);    
}

- (void)testTrimmedString
{
    STAssertEqualObjects([@"       mitotomi      " trimmedString], @"mitotomi", nil);    
}

- (void)testStringByTrimmingCharactersNotInSet
{
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"mito"];
    STAssertEqualObjects([@"       m^it:oto%mi  .    " stringByTrimmingCharactersNotInSet:set], @"mitotomi", nil);    
}

- (void)testUrlEncodedString
{
    STAssertEqualObjects([@"\"Aardvarks lurk, OK?\"" urlEncodedString], @"%22Aardvarks%20lurk%2C%20OK%3F%22", nil);    
}

- (void)testIndexOfSubstring
{
    NSString    *testString = @"testStringtest";
    NSUInteger  testIndex = [testString indexOf:@"test" from:2];
    
    STAssertTrue((testIndex == 10), nil);    
}

- (void)testBool
{
    STAssertEqualObjects([NSString stringFromBool:true], @"TRUE", nil);
    STAssertEqualObjects([NSString stringFromBool:YES], @"TRUE", nil);
    STAssertEqualObjects([NSString stringFromBool:1], @"TRUE", nil);
    STAssertEqualObjects([NSString stringFromBool:false], @"FALSE", nil);
    STAssertEqualObjects([NSString stringFromBool:NO], @"FALSE", nil);
    STAssertEqualObjects([NSString stringFromBool:0], @"FALSE", nil);
}










@end
