//
//  ViewController.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/22/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : TJTableViewController

@property (nonatomic, strong) TJDataSource      *twitterDataSource;
@property (nonatomic, strong) TJDataSource      *githubDataSource;
@property (nonatomic, strong) TJDataSource      *leijonDataSource;
@property (nonatomic, strong) TJDataSource      *selogerDataSource;

@end
