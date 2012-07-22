//
//  TJModel.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import "TJModel.h"

@implementation TJModel

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if ((self = [super init]))
    {
        for (id key in [dictionary allKeys])
        {
            [self setValue:[dictionary objectForKey:key] forKey:key];
        }
    }

    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
