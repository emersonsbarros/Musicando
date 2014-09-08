//
//  IncializaProjeto.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InicializaProjeto.h"


@interface InicializaProjeto : NSObject


+(InicializaProjeto*)sharedManager;

@property NSMutableArray *listaMusicXml;


@end
