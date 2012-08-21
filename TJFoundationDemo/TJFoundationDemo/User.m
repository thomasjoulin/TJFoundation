//
//  User.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "User.h"

@implementation User

- (NSDictionary *)nodeAliases
{
    static NSDictionary *nodeAliases = nil;

    if (nodeAliases == nil)
    {
        nodeAliases = @{
                            @"id"  : @"userId",
                            @"url" : @"userWebsite"
                       };
    }

    return nodeAliases;
}

@end
