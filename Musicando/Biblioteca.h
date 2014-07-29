//
//  Biblioteca.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mascote.h"
#import "Conversa.h"
#import "Fala.h"
#import "Modulo.h"
#import "Aula.h"
#import "Exercicio.h"
#import "TransicaoExercicioViewController.h"

@interface Biblioteca : NSObject

//Atributos
@property NSMutableArray *listaDeModulos;
@property Mascote *mascote;
@property Modulo *moduloAtual;
@property Aula *aulaAtual;
@property Exercicio *exercicioAtual;

//Métodos
-(id)init;
+(Biblioteca*)sharedManager;
-(void)instanciaAulasDoProjeto;

-(Exercicio*)retornaIndiceExercicioModuloBasico:(NSString*)nomeView;
-(void)chamaOProximoExercicio:(UIViewController*)viewAntiga :(NSString*)nomeDaViewAtual;
-(void)chamaViewTransicaoExercicio:(UIViewController*)viewProxAula :(NSString*)nomeDaViewAtual;
-(NSString*)retornaONomeDaProximaAula:(NSString*)nomeDaViewAtual;

@end




