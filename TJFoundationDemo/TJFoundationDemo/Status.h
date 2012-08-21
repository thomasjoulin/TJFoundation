//
//  Status.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "User.h"

@interface Status : TJModel

@property (nonatomic, strong) NSString *statusId;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *in_reply_to_screen_name;
@property (nonatomic, strong) NSString *truncated;
@property (nonatomic, strong) NSString *in_reply_to_status_id;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *in_reply_to_user_id;
@property (nonatomic, strong) NSString *retweet_count;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *favorited;
@property (nonatomic, strong) NSString *retweeted;
@property (nonatomic, strong) User     *user;

@end
