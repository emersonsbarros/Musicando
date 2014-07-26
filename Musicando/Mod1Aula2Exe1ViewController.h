//
//  Mod1Aula2Exe1ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import "EfeitoMascote.h"
#import "EfeitoImagem.h"
#import "EfeitoBarraSuperior.h"
#import <UIKit/UIKit.h>

@interface Mod1Aula2Exe1ViewController : UIViewController

//toca treco
@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;


//mascote
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UIView *viewGesturePassaFala;
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;


@property NSMutableArray *listaImagensColisao;
@property (weak, nonatomic) IBOutlet UIImageView *imgColher;
@property (weak, nonatomic) IBOutlet UIImageView *imgPanela;
@property (weak, nonatomic) IBOutlet UIImageView *imgVibracao;
@property (weak, nonatomic) IBOutlet UIImageView *imgOuvindo;


@property (weak, nonatomic) IBOutlet UIImageView *imgSatelite;
@property (weak, nonatomic) IBOutlet UIImageView *imgAstronauta;
@property (weak, nonatomic) IBOutlet UIImageView *imgExplosao;
@property (weak, nonatomic) IBOutlet UIImageView *imgGestureAstronauta;


@property (weak, nonatomic) IBOutlet UIImageView *pilar1;
@property (weak, nonatomic) IBOutlet UIImageView *pilar2;
@property (weak, nonatomic) IBOutlet UIImageView *pilar3;
@property (weak, nonatomic) IBOutlet UIImageView *pilar4;
@property (weak, nonatomic) IBOutlet UIImageView *base;


@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
@property NSString *estadoAux2;
@property NSString *estadoAux3;

@property NSMutableArray *listaImagensCai;


@end
