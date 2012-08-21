//
//  Repository.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>

@interface Repository : TJModel

@property (nonatomic, strong) NSString *projectDescription;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *watchers;
@property (nonatomic, strong) NSString *url;

@end
