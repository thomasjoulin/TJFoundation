//
//  NSArray+Additions.m
//  callresto
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

- (NSArray *)pluck:(NSString *)propertyName
{
    NSMutableArray *plucked = [NSMutableArray arrayWithCapacity:[self count]];

    for (id obj in self)
    {
        id elem = [obj objectForKey:propertyName];
        
        if (elem)
        {
            [plucked addObject:elem];
        }
    }
    
    return plucked;
}

@end
