//
//  LeijonEvents.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "LeijonEvents.h"
#import "LeijonEvent.h"

@implementation LeijonEvents

- (void)fillWithDictionary:(NSDictionary *)aDictionary
{
    NSArray *events = aDictionary[@"list"][@"models.Event"];
    NSDictionary *dictionary = nil;
    
    if (events)
    {
        dictionary = @{ @"events" : events };
    }

    return [super fillWithDictionary:dictionary];
}

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"events"])
    {
        return [[LeijonEvent alloc] init];
    }

    return nil;
}

@end
