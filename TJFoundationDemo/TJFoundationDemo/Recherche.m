//
//  Recherche.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Recherche.h"
#import "Annonce.h"

@implementation Recherche

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    return [super fillWithDictionary:dictionary[@"recherche"]];
}

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"annonces"])
    {
        return [[Annonces alloc] init];
    }

    return nil;
}

@end
