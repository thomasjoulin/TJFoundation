//
//  NSObject+Blocks.h
//  callresto
//
//  Created by Thomas Joulin on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL (^ TJTestBlock)(id obj);

@interface NSObject (Blocks)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (TJTestBlock)negateBlock:(TJTestBlock)context;

@end
