//
//  UIScreen+Additions.m
//  TJFoundation
//
//  Created by Thomas Joulin on 1/11/13.
//
//

#import "UIScreen+TJFoundation.h"

@implementation UIScreen (TJFoundation)

- (BOOL)hasRetinaDisplay
{
    if ([self respondsToSelector:@selector(scale)])
    {
        return [self scale] == 2.0f;
    }
    
    return NO;
}

@end
