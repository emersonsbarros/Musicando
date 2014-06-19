//
//  Aula.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Aula : UIButton

@property UIImage *capa;
@property NSString *nome;
@property UILabel *descricaoBotao;
@property NSMutableArray *listaDeExercicios;

-(id)init;


@end
