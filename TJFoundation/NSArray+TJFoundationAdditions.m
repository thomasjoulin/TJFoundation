//
//  NSArray+TJFoundationAdditions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 12/17/12.
//
//

#import "NSArray+TJFoundationAdditions.h"

@implementation NSArray (TJFoundationAdditions)

- (id)objectWithValue:(id)value forKey:(id)key
{
    for (id object in self)
    {
        id compareValue = [object valueForKey:key];
        
        if (compareValue && [compareValue isEqual:value])
        {
            return object;
        }
    }
    
    return nil;
}

@end
