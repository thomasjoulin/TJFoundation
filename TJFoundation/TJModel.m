//
//  TJModel.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import "TJModel.h"
#import "NSObject+Properties.h"
#import "NSObject+Additions.h"

@interface TJModel ()

@end

@implementation TJModel

- (void)fillWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        for (id key in [dictionary allKeys])
        {
            NSString *property = key;

            if ([self hasPropertyNamed:key] == NO)
            {
                property = self.nodeAliases[key];
            }

//            NSLog(@"%@, class of property : %@, class of obj : %@", key, [self classForPropertyNamed:property], [dictionary[key] class]);
            if (property && [self hasPropertyNamed:property])
            {
                if ([self typeOfPropertyIsArray:property])
                {
                    NSArray *array = [dictionary objectForKey:key];
                    NSMutableArray *marray = [NSMutableArray arrayWithCapacity:[array count]];

                    for (id obj in array)
                    {
                        TJModel *model = [self modelMappingObjectForNode:property];

                        if (model)
                        {
                            [model fillWithDictionary:obj];
                            [marray addObject:model];
                        }
                    }

                    [self setValue:marray forKey:property];
                }
                else if ([self typeOfPropertyIsString:property])
                {
                    [self setValue:[dictionary objectForKey:key] forKey:property];
                }
                else
                {
                    Class TJModelClass = [self classForPropertyNamed:property];

                    if (TJModelClass)
                    {
                        NSDictionary *obj = [dictionary objectForKey:key];

                        TJModel *model = (TJModel *)[[TJModelClass alloc] init];

                        if (model)
                        {
                            [model fillWithDictionary:obj];
                            [self setValue:model forKey:key];
                        }
                    }
                }
            }
        }
    }
    else
    {
//        NSLog(@"[WARNING] passed an invalid object (expecting NSDictinary): %@", dictionary);
    }
}

- (NSString *)description
{
    return [self descriptionByListingProperties];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (Class)classForNode:(NSString *)nodeName
{
    return nil;
}

- (NSDictionary *)nodeAliases
{
    return nil;
}

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName
{
    return nil;
}

- (NSString *)rootNodeName
{
    return nil;
}

@end
