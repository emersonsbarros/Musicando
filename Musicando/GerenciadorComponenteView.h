//
//  EfeitoComponeteView.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>


//Compontes Edicao e leitura de partituras
#import "PlayerPartituraViewController.h"
#import "ListaInstrumentoViewController.h"
#import "ListaPartiturasViewController.h"
#import "BotaoEstudioViewController.h"
#import "BotaoHomeViewController.h"
#import "BotaoListaPartiturasViewController.h"

#import "BarraNotasPausasViewController.h"
#import "PlayerPartituraEdicaoViewController.h"


@interface GerenciadorComponenteView : NSObject


+(GerenciadorComponenteView*)sharedManager;

//Compontes Edicao e leitura de partituras
-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual;
-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual;
-(void)addComponentesBotaoNomePartitura:(UIViewController*)viewAtual;
-(void)addComponentesListaPartituras:(UIViewController*)viewAtual;
-(void)addComponentesBotaoHome:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesBotaoEstudio:(UIViewController*)viewAtual :(float)posX :(float)posY;
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual;
-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual;


@end
