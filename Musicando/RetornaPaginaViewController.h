//
//  RetornaPaginaViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 10/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercicio.h"
#import "EfeitoTransicao.h"
#import "MascoteViewController.h"

@interface RetornaPaginaViewController : UIViewController 


@property (strong, nonatomic) IBOutlet UIView *viewRetornaPagina;
@property int contadorDeFalas;
@property SEL metodo;
@property UIViewController *cont;

+(RetornaPaginaViewController*)sharedManager;
-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;

-(void)addGesturePassaFalaMascote:(UIView*)viewVoltaFala :(SEL)nomeMetodo :(UIViewController*)cont;


@end
