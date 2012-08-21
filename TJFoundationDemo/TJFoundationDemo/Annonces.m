//
//  Annonces.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "Annonces.h"
#import "Annonce.h"

@implementation Annonces

// Le .m precise que le NSArray est un array d'objet de type....
- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    if ([nodeName isEqualToString:@"annonce"])
    {
        // ... Annonce !
        return [[Annonce alloc] init];
    }

    return nil;
}

@end
