//
//  TJTableViewController.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import "TJTableViewController.h"
#import <objc/runtime.h>

@interface TJTableViewController ()
{
    TJRefreshControl    *_tj_refreshControl;
}

@end

@implementation TJTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self _addRefreshControlToView];
}

- (void)setRefreshControl:(TJRefreshControl *)refreshControl
{
    if (NSClassFromString(@"UIRefreshControl"))
    {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
        [super setRefreshControl:refreshControl];
#pragma clang diagnostic pop
#endif
    }
    else
    {
        [self _setupRefreshControl:refreshControl];
    }
}

- (TJRefreshControl *)refreshControl
{
    if (NSClassFromString(@"UIRefreshControl"))
    {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
        return [super refreshControl];
#pragma clang diagnostic pop
#endif
    }

    return _tj_refreshControl;
}

#pragma mark -
#pragma mark UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self _updateRefreshControlInScrollView:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self _updateRefreshControlInScrollView:scrollView];
}

#pragma mark -
#pragma mark Refresh Control Private Methods

- (void)_setupRefreshControl:(TJRefreshControl *)refreshControl
{
    if (NSClassFromString(@"UIRefreshControl") == nil)
    {
        _tj_refreshControl = refreshControl;
        _tj_refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull down to refresh..."];
        [_tj_refreshControl addTarget:self action:@selector(_refreshControlEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];

        if (self.isViewLoaded)
        {
            [self _addRefreshControlToView];
        }
    }
}

- (void)_addRefreshControlToView
{
    if (NSClassFromString(@"UIRefreshControl") == nil)
    {
        if (_tj_refreshControl && ![_tj_refreshControl superview])
        {
            _tj_refreshControl.frame = CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height - self.tableView.contentInset.top, self.view.frame.size.width, self.tableView.bounds.size.height);
            [self.tableView addSubview:_tj_refreshControl];
        }
    }
}

- (void)_refreshControlEditingDidEnd
{
    if (NSClassFromString(@"UIRefreshControl") == nil)
    {
        if (_tj_refreshControl.isRefreshing == NO)
        {
            [UIView animateWithDuration:.3 animations:^
             {
                 [self.tableView setContentInset:UIEdgeInsetsZero];
             }];

            _tj_refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull down to refresh..."];
        }
        else
        {
            [UIView animateWithDuration:.3 animations:^
             {
                 [self.tableView setContentInset:UIEdgeInsetsMake(60.f, 0.0f, 0.0f, 0.0f)];
                 [self.tableView setContentOffset:CGPointMake(0, -(60.f))];
             }];

            _tj_refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Loading..."];
        }
    }
}

- (void)_updateRefreshControlInScrollView:(UIScrollView *)scrollView
{
    if (NSClassFromString(@"UIRefreshControl") == nil)
    {
        if (_tj_refreshControl)
        {
            if (_tj_refreshControl.isRefreshing)
            {
                CGFloat offset = MAX(scrollView.contentOffset.y * -1, 0);
                offset = MIN(offset, 60);
                scrollView.contentInset = UIEdgeInsetsMake(offset, 0.0f, 0.0f, 0.0f);
            }
            else if (scrollView.isDragging)
            {
                if (_tj_refreshControl.isHighlighted && (scrollView.contentOffset.y) > -65.0f && (scrollView.contentOffset.y) < 0.0f && _tj_refreshControl.refreshing == NO)
                {
                    _tj_refreshControl.highlighted = NO;
                }
                else if (_tj_refreshControl.isHighlighted == NO && (scrollView.contentOffset.y) < -65.0f)
                {
                    _tj_refreshControl.highlighted = YES;
                    _tj_refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Release to refresh..."];
                }
            }
            else if ((scrollView.contentOffset.y) <= - 65.0f && _tj_refreshControl.refreshing == NO)
            {
                _tj_refreshControl.refreshing = YES;    
            }
        }
    }
}

@end
