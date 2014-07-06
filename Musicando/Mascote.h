//
//  Mascote.h
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mascote : NSObject

//Atributos
@property NSString *nome;
@property UIImage *imagem;
@property NSMutableArray *listaDeConversas;

//Métodos
+(Mascote*)sharedManager;

@end
