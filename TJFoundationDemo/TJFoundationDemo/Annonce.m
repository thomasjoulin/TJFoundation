//
//  Annonce.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Annonce.h"
#import "Photos.h"

@implementation Annonce

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"photos"])
    {
        // un array de Photos
        return [[Photos alloc] init];
    }

    return nil;
}

@end
