//
//  Mod1Aula1Exe1ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Nota.h"
#import "Sinfonia.h"
#import "EfeitoImagem.h"
#import "EfeitoMascote.h"
#import <QuartzCore/QuartzCore.h>

@interface Mod1Aula1Exe1ViewController : UIViewController <UIGestureRecognizerDelegate>



//Mascote
//Codigo mutavel
@property NSMutableArray *listaImangesColisao;
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;
@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (weak, nonatomic) IBOutlet UIView *viewGesturePassaFala;


//Toca Treco
@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;
- (IBAction)btnAlavancaTocaTreco:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outAlavancaTocaTreco;


//Atributos para tocar audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


//Atributos para Colisao
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaGalo;
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaCarro;
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaFuracao;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica3;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica2;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica1;


//Atributos para Interagir
@property (weak, nonatomic) IBOutlet UIImageView *imgGaloGrande;
@property (weak, nonatomic) IBOutlet UIImageView *imgPipaGrande;
@property (weak, nonatomic) IBOutlet UIImageView *imgCarroGrande;


//Intro para passar de fala
- (IBAction)btnComecar:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewInicialGesture;


//Atributos para Animacao chover objetos
@property NSMutableArray *listaSons;
@property CGFloat posX;
@property float delay;
@property float duracao;
@property NSMutableArray *listaImagensCai;





@end
