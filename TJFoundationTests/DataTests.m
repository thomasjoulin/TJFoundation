//
//  DataTests.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "DataTests.h"

@implementation DataTests

- (void)testStringValue
{
    NSData *data = [[NSData alloc] initWithBytes:"toto" length:4];
    
    STAssertEqualObjects([data stringValue], @"toto", nil);
}

@end
