//
//  DataBaseNotaPadrao.h
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota.h"
#import "EscolhaUsuarioPartitura.h"
#import "NotaAnimadaPadrao.h"

@interface DataBaseNotaPadrao : NSObject {
    
}

//Lista que contem notas/pausaspadroes
@property NSMutableArray *listaNotasPadroes;


//Metodos
+(DataBaseNotaPadrao*)sharedManager;
-(Nota*)retornaNotaPadrao:(NSString*)nomeNota;

-(NotaAnimadaPadrao*)retornaNotaPadraoCrianca:(NSString*)tipoNomeNota;
-(UIImage*)retornaCarinhaNota:(NSString*)tipoNomeNota;

@end
