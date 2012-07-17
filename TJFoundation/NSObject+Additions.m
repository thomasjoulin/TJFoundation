//
//  NSObject+Additions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/10/12.
//
//

#import "NSObject+Additions.h"

@implementation NSObject (Additions)

- (id)unless:(id)object
{
    return object ? object : self;
}

@end
