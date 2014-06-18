//
//  GerenciadorDeUsuarios.h
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GerenciadorDeUsuarios : NSObject

//Atributos
@property NSMutableArray *listaDeUsuarios;

//Métodos
+(GerenciadorDeUsuarios*)sharedManager;

@end
