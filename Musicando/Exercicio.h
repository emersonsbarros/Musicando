//
//  Exercicio.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mascote.h"

@interface Exercicio : UIButton

@property int idView;
@property NSString *nome;
@property NSString *nomeView;
@property int experiencia;
@property int pontuacaoMaxima;
@property Mascote *mascote;
@property UILabel *descricaoBotao;
@property UIImage *capa;

//Construtor
-(id)init: (int)idView nome:(NSString*)nome nomeView:(NSString*)nomeView experiencia:(int)experiencia pontuacaoMaxima:(int)pontuacaoMaxima mascote:(Mascote*)mascote:(UIImage*)capa;

@end
