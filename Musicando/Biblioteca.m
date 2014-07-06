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
    Exercicio *mod1Aula1Exe1 = [[Exercicio alloc] init:101 nome:@"Introdução a Música" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    
//Aula de Musicalização
    Aula *mod1Aula1 = [[Aula alloc]init];
    mod1Aula1.nome = @"Musicalização";
    mod1Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula1 listaDeExercicios]addObject: mod1Aula1Exe1];

    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula2Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução ao Som" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Som
    Aula *mod1Aula2 = [[Aula alloc]init];
    mod1Aula2.nome = @"Som";
    mod1Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe1];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula3Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução Musical" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];

    
//Aula de Música
    Aula *mod1Aula3 = [[Aula alloc]init];
    mod1Aula3.nome = @"Música";
    mod1Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe1];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe2];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe3];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe4];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe5];

    
    
////////////////////////////////// Aula 4 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula4Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção Musical" nomeView:@"Mod1Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Percepção Musical
    Aula *mod1Aula4 = [[Aula alloc]init];
    mod1Aula4.nome = @"Percepção Musical";
    mod1Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula4 listaDeExercicios]addObject: mod1Aula4Exe1];

    
///////////////////////////// Modulo Inciante //////////////////////////////////
    
    //Cria o modulo Iniciante
    Modulo *moduloIniciante = [[Modulo alloc]init];
    moduloIniciante.nome = @"Iniciante";
    moduloIniciante.capa = [UIImage imageNamed:@"modulo.png"];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula1];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula2];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula3];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula4];
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject: moduloIniciante];
    
}




-(void)instanciaModuloIntermediario{

////////////////////////////////// Aula 1 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula1Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução à Notas" nomeView:@"Mod2Aula1Exe1" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando as Notas" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe3 = [[Exercicio alloc] init:202 nome:@"História das Notas" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Notas
    Aula *mod2Aula1 = [[Aula alloc]init];
    mod2Aula1.nome = @"Notas";
    mod2Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe2];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe3];

    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula2Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Pausas" nomeView:@"Mod2Aula1Exe1" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula2Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando Pausas" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pausas
    Aula *mod2Aula2 = [[Aula alloc]init];
    mod2Aula2.nome = @"Pausas";
    mod2Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula2Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula2Exe2];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula3Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Pentagrama" nomeView:@"Mod2Aula1Exe1" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe2 = [[Exercicio alloc] init:202 nome:@"Exercitando" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe3 = [[Exercicio alloc] init:202 nome:@"Pentagrama, como surgiu?" nomeView:@"Mod2Aula1Exe2" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pentagrama
    Aula *mod2Aula3 = [[Aula alloc]init];
    mod2Aula3.nome = @"Pentagrama";
    mod2Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula3Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula3Exe2];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula3Exe3];

    
    
///////////////////////////// Modulo Intermediario //////////////////////////////////
    
    //Cria o modulo Intermediario
    Modulo *mod = [[Modulo alloc]init];
    mod.nome = @"Intermediario";
    mod.capa = [UIImage imageNamed:@"modulo.png"];
    [[mod listaDeAulas]addObject: mod2Aula1];
    [[mod listaDeAulas]addObject: mod2Aula2];
    
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject:mod];
    
}

-(void)instanciaAulasDoProjeto{
    
    [self instanciaModuloIniciante];
    [self instanciaModuloIntermediario];
}



@end
