//
//  NSUserDefaults+TJFoundation.m
//  TJFoundation
//
//  Created by Thomas Joulin on 1/29/13.
//
//

#import "NSUserDefaults+TJFoundation.h"

@implementation NSUserDefaults (TJFoundation)

- (void)removeObjectForKeys:(NSArray *)arrayOfKeys
{
    for (id key in arrayOfKeys)
    {
        [self removeObjectForKey:key];
    }
}

@end
