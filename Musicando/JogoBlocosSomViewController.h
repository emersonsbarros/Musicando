//
//  JogoBlocosSomViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 16/08/14.
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
#import "GameOverViewController.h"

@interface JogoBlocosSomViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *viewModelagem;

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

@property UIImageView *imgBlocoModelagem;
@property CALayer *borderLayer;
@property UIImageView *imgBlocoCai;


@property (weak, nonatomic) IBOutlet UILabel *lblAltura;
@property (weak, nonatomic) IBOutlet UILabel *lblDuracao;
@property (weak, nonatomic) IBOutlet UILabel *lblIntensidade;
@property (weak, nonatomic) IBOutlet UILabel *lblTimbre;
@property NSString *nomeAltura;
@property NSString *nomeDuracao;
@property NSString *nomeIntensidade;
@property NSString *nomeTimbre;

@property NSString *usuarioAltura;
@property NSString *usuarioDuracao;
@property NSString *usuarioIntensidade;
@property NSString *usuarioTimbre;

@property (weak, nonatomic) IBOutlet UIButton *outBtnFazerBloco;
- (IBAction)btnFazerBloco:(id)sender;

@property UIImageView *imgBocaTocaTreco;
@property (weak, nonatomic) IBOutlet UILabel *lblQtdBloco;

@property int numeroCorAtual;
@property int contadorBlocos;

@property (weak, nonatomic) IBOutlet UILabel *lblTempoRestante;

- (IBAction)btnTocar:(id)sender;

@property Nota *nota;
@property NSMutableArray *listaSons;
@property NSMutableArray *listaBlocosTocaTreco;
@property int tempo;

@property NSTimer *tempoAtual;

@property (weak, nonatomic) IBOutlet UIView *viewJogo;


@end
