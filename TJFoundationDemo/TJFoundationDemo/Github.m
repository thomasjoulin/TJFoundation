//
//  Github.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Github.h"
#import "Event.h"

@implementation Github

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"events"])
    {
        return [[Event alloc] init];
    }

    return nil;
}

- (NSString *)rootNodeName
{
    static NSString *rootNodeName = nil;

    if (rootNodeName == nil)
    {
        rootNodeName = @"events";
    }

    return rootNodeName;
}

@end
