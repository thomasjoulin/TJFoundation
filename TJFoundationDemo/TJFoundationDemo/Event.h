//
//  Event.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "Repository.h"

@interface Event : TJModel

@property (nonatomic, strong) NSString      *type;
@property (nonatomic, strong) NSString      *created_at;
@property (nonatomic, strong) Repository    *repository;

@end
