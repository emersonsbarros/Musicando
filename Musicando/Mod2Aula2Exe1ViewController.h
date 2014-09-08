//
//  Mod2Aula2Exe1ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import "Nota.h"
#import "Sinfonia.h"
#import "ExercicioImagem.h"
#import "ExercicioMascote.h"
#import "ExercicioTransicao.h"
#import "ExercicioPlayer.h"
#import "GerenciadorComponenteView.h"
#import "ExercicioAnimada.h"


@interface Mod2Aula2Exe1ViewController : UIViewController


//--------------- CODIGO QUE REPETE EM TODAS AS VIEWS ---------------------//
//////////////////Codigo mutavel/////////////////
//lista de todas imagens que precisam de colisao
@property NSMutableArray *listaImangesColisao;
//Aux Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;
//Mascote (img,view,label)
@property UIImageView *imagemDoMascote2;
@property UILabel *lblFalaDoMascote;
@property UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
@property UIView *imgTocaTreco;

//-------------------------------------------------------------------------//


//Atributos para tocar audio
@property NSURL *caminhoDoAudio;


@property (weak, nonatomic) IBOutlet UIImageView *pilar3;
@property (weak, nonatomic) IBOutlet UIImageView *base;


@property (weak, nonatomic) IBOutlet UIImageView *imgNotaSemPausa;
@property (weak, nonatomic) IBOutlet UIImageView *imgNotaComPausa;
@property NSMutableArray *listaSons;


@property (weak, nonatomic) IBOutlet UIImageView *imgPausa;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausaDuracao;


@property (weak, nonatomic) IBOutlet UIImageView *imgNotaMusicalCaindo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPontoSom;
@property (weak, nonatomic) IBOutlet UIImageView *imgPontoPausa;
@property (weak, nonatomic) IBOutlet UIImageView *imgPontoNota;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisaoPausa;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisaoSom;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisaoNota;



@end






