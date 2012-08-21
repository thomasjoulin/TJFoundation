//
//  Photos.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Photos.h"
#import "Photo.h"

@implementation Photos

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"photo"])
    {
        return [[Photo alloc] init];
    }

    return nil;
}

@end

