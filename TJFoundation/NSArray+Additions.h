//
//  NSArray+Additions.h
//  callresto
//
//  Created by Thomas Joulin on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Additions)

- (NSArray *)pluck:(NSString *)propertyName;

@end
