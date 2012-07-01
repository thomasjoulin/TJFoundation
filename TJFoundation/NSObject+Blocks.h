//
//  NSObject+Blocks.h
//  callresto
//
//  Created by Thomas Joulin on 11/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSObject (Blocks)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
