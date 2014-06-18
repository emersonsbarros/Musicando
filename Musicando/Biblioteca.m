//
//  Biblioteca.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Biblioteca.h"

@implementation Biblioteca

-(id)init{
    self = [super init];
    if(self){
        
        self.listaDeModulos = [[NSMutableArray alloc]init];
        [self instanciaModulosDoProjeto];
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


+(Biblioteca*)sharedManager{
    static Biblioteca *biblioteca = nil;
    if(!biblioteca){
        biblioteca = [[super allocWithZone:nil] init];
    }
    return biblioteca;
}

-(void)instanciaModulosDoProjeto{
    
    self.iniciante = [[Modulo alloc] init: @"Iniciante"];
    self.intermediario = [[Modulo alloc] init: @"Intermediário"];
    self.avancado = [[Modulo alloc] init: @"Avançado"];
    
    self.mascote = [[Mascote alloc] init];
    
    self.inicianteAula1Exe1 = [[Exercicio alloc] init:11 nome:@"Ritmo do batuque" nomeView:@"Exe11VC" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote];
    self.inicianteAula1Exe2 = [[Exercicio alloc] init:12 nome:@"Palma, palma" nomeView:@"Exe12VC" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote];
    self.inicianteAula2Exe1 = [[Exercicio alloc] init:21 nome:@"Quantas linhas?" nomeView:@"Exe21VC" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote];
    self.inicianteAula2Exe2 = [[Exercicio alloc] init:22 nome:@"Note a nota" nomeView:@"Exe22VC" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote];
    self.intermediarioAula1Exe1 = [[Exercicio alloc] init:11 nome:@"Note a nota" nomeView:@"Exe22VC" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote];

    
}

-(void)instanciaAulasDoProjeto{
    
    
    
}



@end
