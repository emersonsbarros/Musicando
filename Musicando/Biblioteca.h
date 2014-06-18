//
//  Biblioteca.h
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mascote.h"
#import "Modulo.h"
#import "Aula.h"
#import "Exercicio.h"

@interface Biblioteca : NSObject

//Atributos
@property NSMutableArray *listaDeModulos;
@property Mascote *mascote;

    //Módulos
    @property Modulo *iniciante;
    @property Modulo *intermediario;
    @property Modulo *avancado;

    //Aulas
    @property Aula *inicianteAula1;
    @property Aula *inicianteAula2;
    @property Aula *intermediarioAula1;
    @property Aula *intermediarioAula2;
    @property Aula *avancadoAula1;
    @property Aula *avancadoAula2;

    //Exercícios
    @property Exercicio *inicianteAula1Exe1;
    @property Exercicio *inicianteAula1Exe2;
    @property Exercicio *inicianteAula2Exe1;
    @property Exercicio *inicianteAula2Exe2;
    @property Exercicio *intermediarioAula1Exe1;
    @property Exercicio *intermediarioAula1Exe2;
    @property Exercicio *intermediarioAula2Exe1;
    @property Exercicio *intermediarioAula2Exe2;
    @property Exercicio *avancadoAula1Exe1;
    @property Exercicio *avancadoAula1Exe2;
    @property Exercicio *avancadoAula2Exe1;
    @property Exercicio *avancadoAula2Exe2;



//Métodos
-(id)init;
+(Biblioteca*)sharedManager;

@end
