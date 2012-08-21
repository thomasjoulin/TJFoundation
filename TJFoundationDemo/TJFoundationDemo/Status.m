//
//  Status.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Status.h"
#import "User.h"

@implementation Status

- (NSDictionary *)nodeAliases
{
    static NSDictionary *nodeAliases = nil;

    if (nodeAliases == nil)
    {
        nodeAliases = @{ @"id" : @"statusId" };
    }

    return nodeAliases;
}

@end
