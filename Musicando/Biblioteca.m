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
        [self instanciaAulasDoProjeto];
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

-(void)instanciaModuloIniciante{
  
    Exercicio *exer1 = [[Exercicio alloc] init:101 nome:@"Ritmo do batuque" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    Exercicio *exer2 = [[Exercicio alloc] init:102 nome:@"Palma, palma" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    Exercicio *exer3 = [[Exercicio alloc] init:103 nome:@"Quantas linhas?" nomeView:@"Mod1Aula1Exe3" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    Exercicio *exer4 = [[Exercicio alloc] init:104 nome:@"Note a nota" nomeView:@"Mod1Aula1Exe4" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    
    
    Aula *aula1 = [[Aula alloc]init];
    aula1.nome = @"Melodia";
    aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[aula1 listaDeExercicios]addObject:exer1];
    [[aula1 listaDeExercicios]addObject:exer2];
    [[aula1 listaDeExercicios]addObject:exer3];
    [[aula1 listaDeExercicios]addObject:exer4];
    
    
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Iniciante";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject:aula1];
    
    [[self listaDeModulos]addObject:mod];
    
}

-(void)instanciaModuloIntermediario{
    
    Exercicio *exer1 = [[Exercicio alloc] init:201 nome:@"Numero de tempo" nomeView:@"Mod2Aula1Exe1" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    Exercicio *exer2 = [[Exercicio alloc] init:202 nome:@"Unidade Tempo" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"modulo.png"]];
    
    Aula *aula1 = [[Aula alloc]init];
    aula1.nome = @"Compasso";
    aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[aula1 listaDeExercicios]addObject:exer1];
    [[aula1 listaDeExercicios]addObject:exer2];
    
    Aula *aula2 = [[Aula alloc]init];
    aula2.nome = @"Tempo";
    aula2.capa = [UIImage imageNamed:@"aula.png"];
    
    
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Intermediario";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject:aula1];
    [[mod listaDeAulas]addObject:aula2];
    
    [[self listaDeModulos]addObject:mod];
    
}

-(void)instanciaAulasDoProjeto{
    
    [self instanciaModuloIniciante];
    [self instanciaModuloIntermediario];
}



@end
