//
//  TJRefreshControl.m
//  TJFoundation
//
//  Created by Thomas Joulin on 7/19/12.
//
//

#import "TJRefreshControl.h"
#import <TJFoundation/UIImage+Bundle.h>
#import <TJFoundation/NSBundle+TJFoundation.h>
#import <QuartzCore/QuartzCore.h>

#define FLIP_ANIMATION_DURATION 0.18f

typedef enum
{
	TJPullRefreshPulling = 0,
	TJPullRefreshNormal,
	TJPullRefreshLoading,
}       EGOPullRefreshState;

@interface TJRefreshControl ()
{
    UILabel                 *_statusLabel;
    CALayer                 *_arrowImage;
    UIActivityIndicatorView *_activityView;
}

@end

@implementation TJRefreshControl

+ (id)alloc
{
    Class RefreshControl = NSClassFromString(@"UIRefreshControl");

    if (RefreshControl)
    {
        return [RefreshControl alloc];
    }

    return [super alloc];
}

- (id)init
{
    if (self = [super init])
    {
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];

        [self _initializeSubviews];

		[self _setRefreshState:TJPullRefreshNormal];
    }

    return self;
}

- (void)beginRefreshing
{
	[self _setRefreshState:TJPullRefreshLoading];
}

- (void)endRefreshing
{
	[self _setRefreshState:TJPullRefreshNormal];

    [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
}

#pragma mark -
#pragma mark Setters

- (void)setRefreshing:(BOOL)refreshing
{
    if (refreshing)
    {
        [self beginRefreshing];
    }
    else
    {
        [self endRefreshing];
    }

    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
    _attributedTitle = attributedTitle;

    _statusLabel.text = [attributedTitle string];
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        [self _setRefreshState:TJPullRefreshPulling];
    }
    else
    {
        [self _setRefreshState:TJPullRefreshNormal];
    }

    [super setHighlighted:highlighted];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];

    _statusLabel.frame = CGRectMake(0.0f, self.frame.size.height - 48.0f, self.frame.size.width, 20.0f);
    _arrowImage.frame = CGRectMake(25.0f, self.frame.size.height - 65.0f, 30.0f, 55.0f);
    _activityView.frame = CGRectMake(25.0f, self.frame.size.height - 38.0f, 20.0f, 20.0f);
}

- (void)_setRefreshState:(EGOPullRefreshState)aState
{
	switch (aState)
    {
		case TJPullRefreshPulling:
			_statusLabel.text = [_attributedTitle string];
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			break;
		case TJPullRefreshNormal:
            _refreshing = NO;
			if (self.isHighlighted)
            {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}

			_statusLabel.text = [_attributedTitle string];
			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];

			break;
		case TJPullRefreshLoading:
            _refreshing = YES;
			_statusLabel.text = [_attributedTitle string];
			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
			_arrowImage.hidden = YES;
			[CATransaction commit];

			break;
		default:
			break;
	}
}

- (void)_initializeSubviews
{
    UILabel                 *statusLabel;
    CALayer                 *arrowImage;
    UIActivityIndicatorView *activityView;

    statusLabel = [[UILabel alloc] init];
    statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    statusLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    statusLabel.textColor = [UIColor blackColor];
    statusLabel.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    statusLabel.shadowOffset = CGSizeMake(0.0f, 1.0f);
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.textAlignment = UITextAlignmentCenter;

    arrowImage = [CALayer layer];
    arrowImage.contentsGravity = kCAGravityResizeAspect;
    arrowImage.contents = (id)[UIImage imageNamed:@"blueArrow.png" inBundle:[NSBundle TJFoundationBundle]].CGImage;
    #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        arrowImage.contentsScale = [[UIScreen mainScreen] scale];
    }
    #endif

    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

    [[self layer] addSublayer:arrowImage];
    [self addSubview:activityView];
    [self addSubview:statusLabel];

    _activityView = activityView;
    _statusLabel = statusLabel;
    _arrowImage = arrowImage;
}

@end
