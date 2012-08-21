//
//  Photo.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>

@interface Photo : TJModel

@property (nonatomic, strong) NSString *titre;
@property (nonatomic, strong) NSString *ordre;
@property (nonatomic, strong) NSString *thbUrl;
@property (nonatomic, strong) NSString *stdUrl;
@property (nonatomic, strong) NSString *stdwidth;
@property (nonatomic, strong) NSString *stdheight;


@end
