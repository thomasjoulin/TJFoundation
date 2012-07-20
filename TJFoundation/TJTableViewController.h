//
//  TJTableViewController.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import <UIKit/UIKit.h>
#import "TJRefreshControl.h"

@interface TJTableViewController : UITableViewController

@property (nonatomic, strong) TJRefreshControl  *refreshControl;

@end
