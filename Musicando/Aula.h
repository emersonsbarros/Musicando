//
//  Aula.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Aula : NSObject

@property NSString *nome;
@property NSMutableArray *listaDeExercicios;

-(id)init: (NSString*)nome;


@end
