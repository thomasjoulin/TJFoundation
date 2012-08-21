//
//  Annonce.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "Photos.h"

@interface Annonce : TJModel

// pareil pour annonce, plusieurs element de ton xml
@property (nonatomic, strong) NSString *idAnnonce;
@property (nonatomic, strong) NSString *idPublication;
@property (nonatomic, strong) NSString *idTypeTransaction;
@property (nonatomic, strong) NSString *idTypeBien;
@property (nonatomic, strong) NSString *dtFraicheur;
@property (nonatomic, strong) NSString *dtCreation;
@property (nonatomic, strong) NSString *titre;
@property (nonatomic, strong) NSString *libelle;

// et pareil pour la collection de photos :
@property (nonatomic, strong) Photos  *photos;

@end
