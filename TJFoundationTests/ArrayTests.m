//
//  ArrayTests.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "ArrayTests.h"

static NSArray *emptyArray;
static NSArray *singleObject;
static NSArray *threeObjects;

@implementation ArrayTests

- (void)setUp
{
    [super setUp];
    
    emptyArray   = [NSArray array];
    singleObject = [NSArray arrayWithObject:@"foo"];
    threeObjects = [NSArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
}

- (void)testMap
{
    STAssertEqualObjects([emptyArray map:^ id (id any) {return @"test"; }], emptyArray, @"Can handle empty arrays");    
    STAssertEqualObjects([threeObjects map:^ id (id any){ return nil; }], emptyArray, @"Returning nil in the map block removes the object pair");
    
    NSArray *capitalized = [NSArray arrayWithObjects:@"Foo", @"Bar", @"Baz", nil];
    NSArray *result;
                          
    result = [threeObjects
                map:^ NSString * (NSString *string) {
                    return [string capitalizedString];
                }];
    
    STAssertEqualObjects(capitalized, result, @"Can map objects");
}

- (void)testPluck
{
    NSArray *stooges = [NSArray arrayWithObjects:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                                @"moe", @"name",
                                [NSNumber numberWithInt:40], @"age",
                            nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"larry", @"name",
                                 [NSNumber numberWithInt:50], @"age",
                             nil],
                            [NSDictionary dictionaryWithObjectsAndKeys:
                                 @"curly", @"name",
                                 [NSNumber numberWithInt:60], @"age",
                             nil],
                        nil];
    NSArray *expectedPlucks = [NSArray arrayWithObjects:@"moe", @"larry", @"curly", nil];
    
    STAssertEqualObjects([stooges pluck:@"name"], expectedPlucks, nil);
    
    STAssertEqualObjects([emptyArray pluck:@"description"], emptyArray, @"Can handle empty arrays");
    
    NSArray *lengths = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],
                        [NSNumber numberWithInt:3],
                        [NSNumber numberWithInt:3],
                        nil];
    
    STAssertEqualObjects([threeObjects pluck:@"length"], lengths, @"Can extract values for the key path");
}

- (void)testEach
{
    __block NSInteger testRun = 0;
    __block BOOL checkedFoo = NO, checkedBar = NO, checkedBaz = NO;
    
    [threeObjects each:^ (NSString *string)
    {
        if ([string isEqualToString:@"foo"])
        {
            STAssertFalse(checkedFoo, @"Did not check foo before");
            testRun++;
            
            checkedFoo = YES;
        }
        
        if ([string isEqualToString:@"bar"])
        {
            STAssertFalse(checkedBar, @"Did not check bar before");
            testRun++;
            
            checkedBar = YES;
        }
        
        if ([string isEqualToString:@"baz"])
        {
            STAssertFalse(checkedBaz, @"Did not check baz before");
            testRun++;
            
            checkedBaz = YES;
        }
    }];
    
    STAssertEquals(testRun, 3, @"Ran 3 tests");
}

- (void)testReduce;
{
    NSString *result1 = [emptyArray reduceWithMemo:@"test" andReduceBlock:^ id (id memo, id any) { return nil; }];
    
    STAssertEqualObjects(result1, @"test", @"Reducing an empty array yields the input value");
    
    NSString *result2;
    
    result2 = [threeObjects reduceWithMemo:@"the "
                            andReduceBlock:^ id (NSString *memo, NSString *current) {
                                return [memo stringByAppendingString:current];
                            }];
    
    STAssertEqualObjects(result2, @"the foobarbaz", @"Objects are reduced in the correct order");
}

- (void)testReduceRight;
{
    NSString *result1 = [emptyArray reduceRightWithMemo:@"test" andReduceBlock:^ id (id memo, id any) { return nil; }];
    
    STAssertEqualObjects(result1,
                         @"test",
                         @"Reducing an empty array yields the input value");
    
    NSString *result2;
    
    result2 = [threeObjects
                reduceRightWithMemo:@"the " andReduceBlock:^id (NSString *memo, NSString *current) {
                    return [memo stringByAppendingString:current];
                }];
    
    STAssertEqualObjects(result2, @"the bazbarfoo", @"Objects are reduced in the correct order");
}

- (void)testFind;
{
    STAssertNil([emptyArray find:^ BOOL (id any) { return YES; }], @"Can handle empty arrays");
    STAssertNil([threeObjects find:^ BOOL (id any) { return NO; }], @"Returns nil if no object matches");
    
     NSString *result;
     
     result = [threeObjects
                find: ^ BOOL (NSString *string) {
                    return [string characterAtIndex:2] == 'z';
                }];
    
    STAssertEqualObjects(result, @"baz", @"Can find objects");
}

//- (void)testFilter
//{
//    NSArray *array = [NSArray arrayWithObjects:@"toto", @"toti", @"tutu", @"toma", @"tata", nil];
//    NSArray *expected = [NSArray arrayWithObjects:@"toto", @"toti", @"toma", nil];
//    
//    STAssertEqualObjects([array filter:^ BOOL(id obj) {
//        return [obj hasPrefix:@"to"];
//    }], expected, nil);
//    
//    STAssertEqualObjects([emptyArray filter:^ BOOL (id any) { return YES; }], emptyArray, @"Can handle empty arrays");
//    STAssertEqualObjects([threeObjects filter:^ BOOL (id any) { return NO; }], emptyArray, @"Can remove all objects");    
//    STAssertEqualObjects([threeObjects filter:^ BOOL (id any) { return YES; }], threeObjects, @"Can keep all objects");
//    
//    NSArray *result;
//    
//    result = [threeObjects
//              filter:^ BOOL (NSString *string) {
//                  return [string characterAtIndex:0] == 'b';
//              }];
//    
//    NSArray *subrange = [NSArray arrayWithObjects:@"bar", @"baz", nil];
//    STAssertEqualObjects(result, subrange, @"Can filter matching elements");
//
//}
//
//- (void)testReject;
//{
//    STAssertEqualObjects([emptyArray reject:^ BOOL (id any) { return YES; }], emptyArray, @"Can handle empty arrays");
//    STAssertEqualObjects([threeObjects reject:^ BOOL (id any) { return NO; }], threeObjects, @"Can keep all objects");    
//    STAssertEqualObjects([threeObjects reject:^ BOOL (id any) { return YES; }], emptyArray, @"Can remove all objects");
//    
//    NSArray *result;
//    
//    result = [threeObjects
//                reject:^ BOOL (NSString *string) {
//                    return [string characterAtIndex:0] == 'b';
//                }];
//    
//    STAssertEqualObjects(result, singleObject, @"Can remove matching elements");
//}
//
//- (void)testAll;
//{
//    STAssertFalse([emptyArray all:^ BOOL (id any) { return [any isKindOfClass:[NSNull class]]; }], @"Empty array never passes");
//    
//    TJTestBlock isString = ^ BOOL (id obj){
//        return [obj isKindOfClass:[NSString class]];
//    };
//    
//    STAssertTrue([threeObjects all:isString], @"All elements pass");
//    
//    TJTestBlock startsWithB = ^ BOOL (NSString *string) {
//        return [string characterAtIndex:0] == 'b';
//    };
//    
//    STAssertFalse([threeObjects all:startsWithB], @"Not all elements pass");
//    
//    TJTestBlock isNumber = ^ BOOL (id obj){
//        return [obj isKindOfClass:[NSNumber class]];
//    };
//    
//    STAssertFalse([threeObjects all:isNumber], @"No element passes");
//}
//
//- (void)testAny
//{
//    STAssertFalse([emptyArray any:^ BOOL (id any) { return [any isKindOfClass:[NSNull class]]; }], @"Empty array never passes");
//    
//    TJTestBlock isString = ^ BOOL (id obj){
//        return [obj isKindOfClass:[NSString class]];
//    };
//    
//    STAssertTrue([threeObjects any:isString], @"All elements pass");
//    
//    TJTestBlock startsWithB = ^ BOOL (NSString *string) {
//        return [string characterAtIndex:0] == 'b';
//    };
//    
//    STAssertTrue([threeObjects any:startsWithB], @"One element pass");
//    
//    TJTestBlock isNumber = ^ BOOL (id obj){
//        return [obj isKindOfClass:[NSNumber class]];
//    };
//    
//    STAssertFalse([threeObjects all:isNumber], @"No element passes");
//}

- (void)testMax
{
    NSArray *numbers = @[ @1, @4, @2, @120, @42 ];
    NSArray *lengths = @[ @"123", @"123456789", @"1", @"123456" ];

    STAssertEqualObjects([numbers max], @120, nil);
    STAssertEqualObjects([[lengths pluck:@"length"] max], @9, nil);
}

- (void)testMin
{
    NSArray *numbers = @[ @(-1), @4, @2, @120, @42 ];
    NSArray *lengths = @[ @"123", @"123456789", @"1", @"123456" ];

    STAssertEqualObjects([numbers min], @(-1), nil);
    STAssertEqualObjects([[lengths pluck:@"length"] min], @1, nil);
}

- (void)testGroupBy
{
    NSArray *a;
    NSDictionary *expected;

    a = @[ @1.3f, @2.1f, @2.4f ];
    expected = @{ @1 : @[ @1.3f ], @2: @[ @2.1f, @2.4f ] };

    STAssertEqualObjects([a groupUsingBlock:^ id (NSNumber *num) { return @(floor([num floatValue])); }], expected, nil);

    a = @[ @"one", @"two", @"three" ];
    expected = @{ @3 : @[ @"one", @"two" ], @5 : @[ @"three" ] };

    STAssertEqualObjects([a groupBy:@"length"], expected, nil);
}

- (void)testFirstObject
{
    STAssertEqualObjects([threeObjects firstObject], @"foo", nil);
}

- (void)testZip
{
    NSArray *ret, *expected;

    ret = [@[ @"llama", @"alpaca", @"lemming" ] zip:@[ @"larry", @"al", @"lem" ], nil];
    expected = @[ @[ @"llama", @"larry" ], @[ @"alpaca", @"al" ], @[ @"lemming", @"lem" ] ];
    STAssertEqualObjects(ret, expected, nil);

    ret = [@[ @"a", @"b", @"c" ] zip:@[ @1 ], @[ @"x", @"y", @"z" ], nil];
    expected = @[ @[ @"a", @1, @"x" ], @[ @"b", [NSNull null], @"y" ], @[ @"c", [NSNull null], @"z" ] ];
    STAssertEqualObjects(ret, expected, nil);

    ret = [@[ @"a" ] zip:@[ @1 ], @[ @"x", @"y", @"z" ], nil];
    expected = @[ @[ @"a", @1, @"x" ], @[ [NSNull null], [NSNull null], @"y" ], @[ [NSNull null], [NSNull null], @"z" ]];
    STAssertEqualObjects(ret, expected, nil);

    ret = [@[ @"moe", @"larry", @"curly" ] zip:@[ @30, @40, @50 ], @[ @(YES), @(NO), @(NO)], nil];
    expected = @[ @[ @"moe", @30, @(YES)], @[ @"larry", @40, @(NO) ], @[ @"curly", @50, @(NO)]];
    STAssertEqualObjects(ret, expected, nil);
}

@end













