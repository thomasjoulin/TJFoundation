//
//  Recherche.h
//  TJFoundationDemo
//
//  Created by Thomas Joulin on 7/23/12.
//  Copyright (c) 2012 Thomas Joulin. All rights reserved.
//

#import <TJFoundation/TJFoundation.h>
#import "Annonces.h"

@interface Recherche : TJModel

// j'ai mis quelques attributs du XML
@property (nonatomic, strong) NSString *resume;
@property (nonatomic, strong) NSString *resumeSansTri;
@property (nonatomic, strong) NSString *nbTrouvees;
@property (nonatomic, strong) NSString *nbAffichables;
@property (nonatomic, strong) NSString *pageCourante;
@property (nonatomic, strong) NSString *pageMax;
@property (nonatomic, strong) NSString *pageSuivante;

// Ici "annonces" est une liste d'annonce
@property (nonatomic, strong) Annonces  *annonces;

@end
