//
//  Mod1Aula2Exe1ViewController.h
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
#import "EfeitoImagem.h"
#import "EfeitoMascote.h"
#import "EfeitoTransicao.h"
#import "EfeitoPlayer.h"
#import "EfeitoComponeteView.h"
#import "EfeitoNotaAnimada.h"


@interface Mod1Aula2Exe1ViewController : UIViewController


//Atributos para tocar audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


//mascote
@property UILabel *lblFalaDoMascote;
@property UIImageView *imagemDoMascote2;
@property  UIView *viewGesturePassaFala;
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
@property  UIView *imgTocaTreco;


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






@end
