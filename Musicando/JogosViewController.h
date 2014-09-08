//
//  JogosViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 24/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "Modulo.h"
#import "Biblioteca.h"
#import "Aula.h"
#import "Exercicio.h"
#import "ExercicioImagem.h"

@interface JogosViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *imgFrameTv;

@property (weak, nonatomic) IBOutlet UIView *viewTelevisao;

@property NSMutableArray *listaExercicios;


@end
