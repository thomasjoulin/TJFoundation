//
//  NSObject+Blocks.m
//  callresto
//
//  Created by Thomas Joulin on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NSObject+Blocks.h"

@implementation NSObject (Blocks)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

+ (TJTestBlock)negateBlock:(TJTestBlock)context
{
    return ^ BOOL (id obj) {
        return !context(obj);
    };
}

@end