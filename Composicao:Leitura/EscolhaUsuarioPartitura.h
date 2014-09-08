//
//  EscolhaUsuarioPartitura.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota.h"

@interface EscolhaUsuarioPartitura : NSObject


@property NSString *nomeInstrumentoPartitura;
@property NSString *nomeXmlPartitura;


@property Nota *notaEscolhaUsuarioEdicao;

+(EscolhaUsuarioPartitura*)sharedManager;



@end
