//
//  Exercicio.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Exercicio.h"

@implementation Exercicio


-(id)init: (int)idView nome:(NSString*)nome nomeView:(NSString*)nomeView experiencia:(int)experiencia pontuacaoMaxima:(int)pontuacaoMaxima mascote:(Mascote*)mascote{
    
    self = [super init];
    if(self){
        
        self.idView = idView;
        self.nome = nome;
        self.nomeView = nomeView;
        self.experiencia = experiencia;
        self.pontuacaoMaxima = pontuacaoMaxima;
        self.mascote = mascote;
        
    }
    return self;
}



@end
