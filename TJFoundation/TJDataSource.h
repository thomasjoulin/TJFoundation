//
//  TJDataSource.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/22/12.
//
//

#import <Foundation/Foundation.h>
#import "TJModel.h"

typedef enum
{
    TJDataSourceTypeXML,
    TJDataSourceTypeJSON,
}       TJDataSourceType;

@protocol TJDataSourceDelegate;

@interface TJDataSource : NSObject

@property (nonatomic, assign) NSObject<TJDataSourceDelegate>    *delegate;
@property (nonatomic, strong) TJModel *model;
@property (nonatomic, assign) TJDataSourceType type;

- (id)initWithUrl:(NSURL *)url modelMappingObject:(TJModel *)model;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfObjectsInSection:(NSInteger)section;
- (NSInteger)numberOfSections;

- (void)reload;

@end

@protocol TJDataSourceDelegate <NSObject>

@optional
- (void)datasourceDidFinishLoading:(TJDataSource *)datasource;
- (void)datasource:(TJDataSource *)datasource didFailWithError:(NSError *)error;

@end