//
//  TransicaoExercicioViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 27/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Biblioteca.h"
#import "EfeitoImagem.h"

@interface TransicaoExercicioViewController : UIViewController

@property NSMutableArray *listaImagensCai;
@property (weak, nonatomic) IBOutlet UILabel *txtProximaAula;

@end
