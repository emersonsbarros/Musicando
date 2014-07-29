//
//  EfeitoBarraSuperior.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 23/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BarraSuperiorViewController.h"
#import "Exercicio.h"

@interface EfeitoBarraSuperior : UIViewController


@property NSString *textoAulaAtual;

+(EfeitoBarraSuperior*)sharedManager;
-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;

@end
