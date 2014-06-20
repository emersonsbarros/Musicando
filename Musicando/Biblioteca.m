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
  
////////////////////////////////// Aula 1 //////////////////////////////////////
    
    //Exercicios da Aula1
    Exercicio *exer1 = [[Exercicio alloc] init:101 nome:@"Ritmo do batuque" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *exer2 = [[Exercicio alloc] init:102 nome:@"Palma, palma" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    //Aulas do Modulo Inciante
    Aula *aula1 = [[Aula alloc]init];
    aula1.nome = @"Melodia";
    aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[aula1 listaDeExercicios]addObject:exer1];
    [[aula1 listaDeExercicios]addObject:exer2];
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
    
////////////////////////////////// Aula 4 //////////////////////////////////////

    
///////////////////////////// Modulo Inciante //////////////////////////////////
    
    //Cria o modulo Iniciante
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Iniciante";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject:aula1];
    
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject:mod];
    
}

-(void)instanciaModuloIntermediario{

////////////////////////////////// Aula 1 //////////////////////////////////////
    
    //Exercicios da Aula1
    Exercicio *exer1 = [[Exercicio alloc] init:201 nome:@"Numero de tempo" nomeView:@"Mod2Aula1Exe1" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *exer2 = [[Exercicio alloc] init:202 nome:@"Unidade Tempo" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    //Aulas do Modulo Intermediario
    Aula *aula1 = [[Aula alloc]init];
    aula1.nome = @"Compasso";
    aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[aula1 listaDeExercicios]addObject:exer1];
    [[aula1 listaDeExercicios]addObject:exer2];
    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
    //Aulas do Modulo Intermediario
    Aula *aula2 = [[Aula alloc]init];
    aula2.nome = @"Tempo";
    aula2.capa = [UIImage imageNamed:@"aula.png"];

    
    
///////////////////////////// Modulo Intermediario //////////////////////////////////
    
    //Cria o modulo Intermediario
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Intermediario";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject:aula1];
    [[mod listaDeAulas]addObject:aula2];
    
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject:mod];
    
}

-(void)instanciaAulasDoProjeto{
    
    [self instanciaModuloIniciante];
    [self instanciaModuloIntermediario];
}



@end
