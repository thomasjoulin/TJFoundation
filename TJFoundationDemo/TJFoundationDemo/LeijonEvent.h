//
//  LeijonEvent.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>

@interface LeijonEvent : TJModel

@property (nonatomic, strong) NSString  *eventId;
@property (nonatomic, strong) NSString  *timeStart;
@property (nonatomic, strong) NSString  *timeFinish;
@property (nonatomic, strong) NSString  *comments;
@property (nonatomic, strong) NSString  *month;
@property (nonatomic, strong) NSString  *vehicle;
@property (nonatomic, strong) NSString  *distance;
@property (nonatomic, strong) NSString  *userId;
@property (nonatomic, strong) NSString  *date;
@property (nonatomic, strong) NSString  *submitted;
@property (nonatomic, strong) NSString  *lastUpdatedDate;

@end
