//
//  LeijonEvent.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "LeijonEvent.h"

@implementation LeijonEvent

- (NSDictionary *)nodeAliases
{
    static NSDictionary *nodeAliases = nil;

    if (nodeAliases == nil)
    {
        nodeAliases = @{ @"id" : @"eventId" };
    }

    return nodeAliases;
}

@end
