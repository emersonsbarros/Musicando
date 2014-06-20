//
//  Modulo.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Modulo : UIButton {
    
}

//Atributos
@property UIImage *capa;
@property NSString *nome;
@property NSMutableArray *listaDeAulas;
@property UILabel *descricaoBotao;


//Construtor
- (id)init;

@end
