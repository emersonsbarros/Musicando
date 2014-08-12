//
//  EfeitoTransicao.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 10/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercicio.h"
#import "Biblioteca.h"
#import "TransicaoExercicioViewController.h"
#import "BarraSuperiorViewController.h"

@interface EfeitoTransicao : NSObject


+(EfeitoTransicao*)sharedManager;
-(void)chamaTransicaoPaginaEsquerda:(UIViewController*)controller;
-(void)chamaTransicaoPaginaDireita:(UIViewController*)controller;
-(void)chamaTransicaoPaginaTopo:(UIViewController*)controller;

-(void)finalizaExercicio:(UIViewController*)contr;
-(Exercicio*)retornaIndiceExercicioModuloBasico:(NSString*)nomeView;
-(void)chamaOProximoExercicio:(UIViewController*)viewAntiga :(NSString*)nomeDaViewAtual;
-(void)chamaViewTransicaoExercicio:(UIViewController*)viewProxAula :(NSString*)nomeDaViewAtual;
-(NSString*)retornaONomeDaProximaAula:(NSString*)nomeDaViewAtual;

@end
