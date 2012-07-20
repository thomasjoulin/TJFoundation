//
//  TJRefreshControl.h
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import <UIKit/UIKit.h>

/*
    This class will return a valid UIRefreshControl on iOS6
 */
@interface TJRefreshControl : UIControl

@property (nonatomic, strong) NSAttributedString            *attributedTitle;
@property (nonatomic, assign, getter = isRefreshing) BOOL   refreshing;

- (void)beginRefreshing;
- (void)endRefreshing;

@end

