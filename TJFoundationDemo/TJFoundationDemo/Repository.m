//
//  Repository.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Repository.h"

@implementation Repository

- (NSDictionary *)nodeAliases
{
    static NSDictionary *nodeAliases = nil;

    if (nodeAliases == nil)
    {
        nodeAliases = @{ @"description" : @"projectDescription" };
    }

    return nodeAliases;
}

@end
