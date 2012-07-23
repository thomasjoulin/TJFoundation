//
//  TJTableViewController.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import <UIKit/UIKit.h>
#import "TJRefreshControl.h"
#import "TJDataSource.h"
#import "TJModel.h"

@interface TJTableViewController : UITableViewController <TJDataSourceDelegate>

@property (nonatomic, strong) TJRefreshControl  *refreshControl;

@end
