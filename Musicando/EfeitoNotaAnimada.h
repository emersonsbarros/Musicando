//
//  EfeitoNotaAnimada.h
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nota.h"
#import "Sinfonia.h"
#import "EfeitoImagem.h"

@interface EfeitoNotaAnimada : NSObject


//Atributos para Animacao chover objetos
@property NSMutableArray *listaSons;
@property CGFloat posX;
@property float delay;
@property float duracao;
@property NSMutableArray *listaImagensCai;

+(EfeitoNotaAnimada*)sharedManager;

-(void)animacaoCaiNotaIdaVolta:(UIViewController*)controler;
-(void)animacaoCaiNotaOndas:(UIViewController*)controler;

-(void)removeAnimacao;

@end
