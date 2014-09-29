//
//  Glossario.h
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Glossario : NSObject

//Atributos
@property NSMutableArray *listaDeTopicos;

//Métodos
+(Glossario*)sharedManager;

@end
