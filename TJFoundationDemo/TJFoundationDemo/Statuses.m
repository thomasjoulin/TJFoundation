//
//  Statuses.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Statuses.h"
#import "Status.h"

@implementation Statuses

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    return [super fillWithDictionary:dictionary[@"statuses"]];
}

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"status"])
    {
        return [[Status alloc] init];
    }

    return nil;
}

@end
