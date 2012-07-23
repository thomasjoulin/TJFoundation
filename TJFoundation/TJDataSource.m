//
//  TJDataSource.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import "TJDataSource.h"
#import "AFNetworking.h"
#import "TBXML+NSDictionary.h"

@interface TJDataSource ()
{
    NSURL       *_url;
}

@end

@implementation TJDataSource

- (id)initWithUrl:(NSURL *)url modelMappingObject:(TJModel *)model
{
    if ((self = [super init]))
    {
        _url = url;
        _model = model;
        _type = TJDataSourceTypeXML;
    }

    return self;
}

- (void)reload
{
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];

    if (_type == TJDataSourceTypeXML)
    {
        [self _performXMLOperationWithRequest:request];
    }
    else if (_type == TJDataSourceTypeJSON)
    {
        [self _performJSONOperationWithRequest:request];
    }
}

- (void)_performJSONOperationWithRequest:(NSURLRequest *)request
{
    AFJSONRequestOperation *operation;

    operation = [AFJSONRequestOperation
                    JSONRequestOperationWithRequest:request
                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject)
                    {
                        if ([responseObject isKindOfClass:[NSArray class]])
                        {
                            if (_model.rootNodeName)
                            {
                                [_model fillWithDictionary:@{ _model.rootNodeName : responseObject }];
                            }
                        }
                        else
                        {
                            [_model fillWithDictionary:responseObject];
                        }

                        if ([self.delegate respondsToSelector:@selector(datasourceDidFinishLoading:)])
                        {
                            [self.delegate datasourceDidFinishLoading:self];
                        }
                    }
                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
                    {
                        NSLog(@"%@", error);
                    }];

    [operation start];
}

- (void)_performXMLOperationWithRequest:(NSURLRequest *)request
{
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];

    [operation
     setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, NSData *responseObject)
     {
         NSDictionary *responseDictionary = [TBXML dictionaryWithXMLData:responseObject];
//         NSLog(@"%@", responseDictionary);

         [_model fillWithDictionary:responseDictionary];

         if ([self.delegate respondsToSelector:@selector(datasourceDidFinishLoading:)])
         {
             [self.delegate datasourceDidFinishLoading:self];
         }
     }
     failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@", error);
     }];

    [operation start];
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)numberOfObjectsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSections
{
    return 0;
}


@end
