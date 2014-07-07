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
        self.mascote = [[Mascote alloc] init];
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
    Exercicio *mod1Aula2Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução ao Som" nomeView:@"Mod1Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Som
    Aula *mod1Aula2 = [[Aula alloc]init];
    mod1Aula2.nome = @"Som";
    mod1Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe1];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula3Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução Musical" nomeView:@"Mod1Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula3Exe4ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
    Exercicio *mod1Aula3Exe5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula3Exe5ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];

    
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
    Exercicio *mod1Aula4Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção Musical" nomeView:@"Mod1Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
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
    Exercicio *mod2Aula1Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução à Notas" nomeView:@"Mod2Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando as Notas" nomeView:@"Mod2Aula1Exe2ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe3 = [[Exercicio alloc] init:202 nome:@"História das Notas" nomeView:@"Mod2Aula1Exe3ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Notas
    Aula *mod2Aula1 = [[Aula alloc]init];
    mod2Aula1.nome = @"Notas";
    mod2Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe2];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe3];

    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula2Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Pausas" nomeView:@"Mod2Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula2Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando Pausas" nomeView:@"Mod2Aula2Exe12ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pausas
    Aula *mod2Aula2 = [[Aula alloc]init];
    mod2Aula2.nome = @"Pausas";
    mod2Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe1];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe2];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula3Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Pentagrama" nomeView:@"Mod2Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe2 = [[Exercicio alloc] init:202 nome:@"Exercitando" nomeView:@"Mod2Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe3 = [[Exercicio alloc] init:202 nome:@"Pentagrama, como surgiu?" nomeView:@"Mod2Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pentagrama
    Aula *mod2Aula3 = [[Aula alloc]init];
    mod2Aula3.nome = @"Pentagrama";
    mod2Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe1];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe2];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe3];


////////////////////////////////// Aula 4 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula4Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução a simbologia das notas" nomeView:@"Mod2Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe2 = [[Exercicio alloc] init:202 nome:@"Apresentando a Imagem das notas" nomeView:@"Mod2Aula4Exe2ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe3 = [[Exercicio alloc] init:202 nome:@"Treinando com Imagem das notas" nomeView:@"Mod2Aula4Exe3ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe4 = [[Exercicio alloc] init:202 nome:@"Treinamento" nomeView:@"Mod2Aula4Exe4ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe5 = [[Exercicio alloc] init:202 nome:@"Novas imagens de Notas" nomeView:@"Mod2Aula4Exe5ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe6 = [[Exercicio alloc] init:202 nome:@"Introdução aos símbolos das pausas" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe7 = [[Exercicio alloc] init:202 nome:@"Resumo final" nomeView:@"Mod2Aula4Exe7ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];

    
//Aula de Notação nota/pausa
    Aula *mod2Aula4 = [[Aula alloc]init];
    mod2Aula4.nome = @"Notação nota/pausa";
    mod2Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe1];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe2];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe3];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe4];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe5];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe6];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe7];

    
////////////////////////////////// Aula 5 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula5Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Oitavas" nomeView:@"Mod2Aula5Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Oitavas
    Aula *mod2Aula5 = [[Aula alloc]init];
    mod2Aula5.nome = @"Oitavas";
    mod2Aula5.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula5 listaDeExercicios]addObject: mod2Aula5Exe1];
    
    
////////////////////////////////// Aula 6 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula6Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Claves" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Claves
    Aula *mod2Aula6 = [[Aula alloc]init];
    mod2Aula6.nome = @"Claves";
    mod2Aula6.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula6 listaDeExercicios]addObject: mod2Aula6Exe1];
    
    
    
////////////////////////////////// Aula 7 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula7Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Compasso" nomeView:@"Mod2Aula7Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe2 = [[Exercicio alloc] init:201 nome:@"Número de Compasso" nomeView:@"Mod2Aula7Exe2ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe3 = [[Exercicio alloc] init:201 nome:@"Unidade de Tempo" nomeView:@"Mod2Aula7Exe3ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe4 = [[Exercicio alloc] init:201 nome:@"Fórmula de Compasso" nomeView:@"Mod2Aula7Exe4ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe5 = [[Exercicio alloc] init:201 nome:@"Complemento" nomeView:@"Mod2Aula7Exe5ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe6 = [[Exercicio alloc] init:201 nome:@"Compasso Gestual" nomeView:@"Mod2Aula7Exe6ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Compasso
    Aula *mod2Aula7 = [[Aula alloc]init];
    mod2Aula7.nome = @"Compasso";
    mod2Aula7.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe1];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe2];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe3];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe4];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe5];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe6];
    
    
    
////////////////////////////////// Aula 8 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula8Exe1 = [[Exercicio alloc] init:201 nome:@"Resumo de Partitura" nomeView:@"Mod2Aula8Exe1ViewController" experiencia:10 pontuacaoMaxima:10 mascote:self.mascote :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Claves
    Aula *mod2Aula8 = [[Aula alloc]init];
    mod2Aula8.nome = @"Claves";
    mod2Aula8.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula8 listaDeExercicios]addObject: mod2Aula8Exe1];
    
    
///////////////////////////// Modulo Intermediario //////////////////////////////////
    
    //Cria o modulo Intermediario
    Modulo *moduloIntermediario = [[Modulo alloc]init];
    moduloIntermediario.nome = @"Intermediario";
    moduloIntermediario.capa = [UIImage imageNamed:@"modulo.png"];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula1];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula2];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula3];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula4];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula5];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula6];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula7];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula8];
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject: moduloIntermediario];
    
}

-(void)instanciaAulasDoProjeto{
    [self instanciaModuloIniciante];
    [self instanciaModuloIntermediario];
}



@end
