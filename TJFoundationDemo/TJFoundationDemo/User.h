//
//  User.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>

@interface User : TJModel

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screen_name;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *profile_image_url;
@property (nonatomic, strong) NSString *profile_image_url_https;
@property (nonatomic, strong) NSString *userWebsite;
@property (nonatomic, strong) NSString *followers_count;
@property (nonatomic, strong) NSString *statuses_count;

@end
