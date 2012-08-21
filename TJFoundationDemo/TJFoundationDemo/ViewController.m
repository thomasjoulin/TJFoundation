//
//  ViewController.m
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/22/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import "ViewController.h"
#import "Statuses.h"
#import "User.h"
#import "Github.h"
#import "Event.h"
#import "LeijonEvent.h"
#import "LeijonEvents.h"
#import "Recherche.h"
#import "Annonce.h"
#import "Photo.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init
{
    if ((self = [super init]))
    {
        NSURL   *url;

        url = [NSURL URLWithString:@"https://twitter.com/statuses/user_timeline/thomasjoulin.xml"];
        Statuses *statuses = [[Statuses alloc] init];
        self.twitterDataSource = [[TJDataSource alloc] initWithUrl:url modelMappingObject:statuses];
        self.twitterDataSource.delegate = self;

        [self.twitterDataSource reload];


        url = [NSURL URLWithString:@"https://github.com/thomasjoulin.json"];
        Github *github = [[Github alloc] init];
        self.githubDataSource = [[TJDataSource alloc] initWithUrl:url modelMappingObject:github];
        self.githubDataSource.type = TJDataSourceTypeJSON;
        self.githubDataSource.delegate = self;

        [self.githubDataSource reload];

        url = [NSURL URLWithString:@"http://79.125.25.91:8080/leijonevent/getUserEvents?date=072012&apiPassword=tml789leijonevent&userId=3&"];
        LeijonEvents *events = [[LeijonEvents alloc] init];
        self.leijonDataSource = [[TJDataSource alloc] initWithUrl:url modelMappingObject:events];
        self.leijonDataSource.delegate = self;

        [self.leijonDataSource reload];

        url = [NSURL URLWithString:@"http://ws.seloger.com/search.xml?idtt=1&cp=75001,%2075002,%2075003,%2075004&idtypebien=1"];
        Recherche *recherche = [[Recherche alloc] init];
        self.selogerDataSource = [[TJDataSource alloc] initWithUrl:url modelMappingObject:recherche];
        self.selogerDataSource.delegate = self;

        [self.selogerDataSource reload];

    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)datasourceDidFinishLoading:(TJDataSource *)datasource
{
    if (datasource == self.twitterDataSource)
    {
        Statuses *model = (Statuses *)datasource.model;

        for (Status *status in model.status)
        {
            NSLog(@"%@, %@", status.statusId, status.user.userId);
        }
    }
    else if (datasource == self.githubDataSource)
    {
        Github *github = (Github *)datasource.model;

        for (Event *event in github.events)
        {
            NSLog(@"%@ : %@ (%@)", event.type, event.repository.name, event.repository.url);
        }
    }
    else if (datasource == self.leijonDataSource)
    {
        LeijonEvents *events = (LeijonEvents *)datasource.model;

        for (LeijonEvent *event in events.events)
        {
            NSLog(@"%@: %@-%@", event.eventId, event.timeStart, event.timeFinish);
        }
    }
    else if (datasource == self.selogerDataSource)
    {
        Recherche *recherche = (Recherche *)datasource.model;

        NSLog(@"%@, %@ (%@/%@)", recherche.resume, recherche.nbTrouvees, recherche.pageCourante, recherche.pageMax);
        for (Annonce *annonce in recherche.annonces.annonce)
        {
            NSLog(@"* %@: %@ – %@", annonce.idAnnonce, annonce.titre, annonce.libelle);
            for (Photo *photo in annonce.photos.photo)
            {
                NSLog(@"    %@x%@ : %@", photo.stdwidth, photo.stdheight, photo.stdUrl);
            }
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
