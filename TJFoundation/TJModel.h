//
//  TJModel.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface TJModel : NSObject

@property (nonatomic, strong) NSURL     *url;

- (void)fillWithDictionary:(NSDictionary *)dictionary;

- (TJModel *)modelMappingObjectForNode:(NSString *)nodeName;
- (NSDictionary *)nodeAliases;
- (NSString *)rootNodeName;

@end
