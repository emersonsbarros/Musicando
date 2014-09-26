//
//  DesenhaPartituraEdicao.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EscolhaUsuarioPartitura.h"
#import "NotaEdicaoGesture.h"
#import "ComponenteScrollEdicao.h"
#import "DataBaseNotaPadrao.h"
#import "NotaAnimadaPadrao.h"

@interface DesenhaPartituraEdicao : NSObject {
    
    int espacamentoEntreNotas;
}

+(DesenhaPartituraEdicao*)sharedManager;
@property NSMutableArray *listaImagensTracoPentagrama;
-(void)desenhaContornoPartituraParaEdicao:(int)qtLinhas;
@property  Nota *notaParaEdicao;
@property NSMutableArray *listaNotasEdicao;
@property int posicaoX;

-(void)rearranjaPosicoesNotas:(int)posicaoNotaDeletada;
-(Nota*)retornaPosicaoNotaEdicao:(float)posx :(float)posy;
-(void)aumentarLinhasPentagrama;


@end
