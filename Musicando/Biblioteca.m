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






//MÓDULOS-----------------------------------------

/*
 PADRÃO DE NOMENCLATURA DOS OBJETOS
 
 MODULO-AULA-EXERCICIO
 Exemplo: MÓDULO 1 - AULA 1 - EXERCÍCIO 1 = m1a1Exercicio1
 */

//------------------------------------------------


//INICIANTE
-(void)instanciaModuloIniciante{
  
////////////////////////////////// Aula 1 //////////////////////////////////////
    
//Exercícios
    Exercicio *m1a1Exercicio1 = [[Exercicio alloc] init:101 nome:@"Introdução a Música" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    
//Aula de Musicalização
    Aula *m1Aula1 = [[Aula alloc]init];
    m1Aula1.nome = @"Musicalização";
    m1Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[m1Aula1 listaDeExercicios]addObject:m1a1Exercicio1];

    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercícios
    Exercicio *m1a2Exercicio1 = [[Exercicio alloc] init:102 nome:@"Introdução ao Som" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Som
    Aula *m1Aula2 = [[Aula alloc]init];
    m1Aula2.nome = @"Som";
    m1Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[m1Aula2 listaDeExercicios]addObject: m1a2Exercicio1];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercícios
    Exercicio *m1a3Exercicio1 = [[Exercicio alloc] init:102 nome:@"Introdução Musical" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *m1a3Exercicio2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *m1a3Exercicio3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *m1a3Exercicio4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *m1a3Exercicio5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];

    
//Aula de Música
    Aula *m1Aula3 = [[Aula alloc]init];
    m1Aula3.nome = @"Música";
    m1Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[m1Aula3 listaDeExercicios]addObject: m1a3Exercicio1];
    [[m1Aula3 listaDeExercicios]addObject: m1a3Exercicio2];
    [[m1Aula3 listaDeExercicios]addObject: m1a3Exercicio3];
    [[m1Aula3 listaDeExercicios]addObject: m1a3Exercicio4];
    [[m1Aula3 listaDeExercicios]addObject: m1a3Exercicio5];

    
    
////////////////////////////////// Aula 4 //////////////////////////////////////
    
//Exercícios
    Exercicio *m1a4Exercicio1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção Musical" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Som
    Aula *m1Aula4 = [[Aula alloc]init];
    m1Aula4.nome = @"Percepção Musical";
    m1Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[m1Aula4 listaDeExercicios]addObject: m1a4Exercicio1];

    
///////////////////////////// Modulo Inciante //////////////////////////////////
    
    //Cria o modulo Iniciante
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Iniciante";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject: m1Aula1];
    [[mod listaDeAulas]addObject: m1Aula2];
    [[mod listaDeAulas]addObject: m1Aula3];
    [[mod listaDeAulas]addObject: m1Aula4];
    
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
