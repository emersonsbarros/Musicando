//
//  Usuario.h
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

//Atributos
@property NSString *nome;
@property int experiencia;
@property NSMutableArray *listaDeExerciciosFeitos; //Guarda apenas a referência para o exe.
@property NSMutableArray *listaDeExerciciosAFazer; //Guarda apenas a referência para o exe.


@end
