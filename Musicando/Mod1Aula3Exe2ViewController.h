//
//  Mod1Aula3Exe2ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import <AVFoundation/AVFoundation.h>
#import "Nota.h"
#import "Sinfonia.h"
#import "EfeitoImagem.h"
#import "EfeitoMascote.h"
#import "EfeitoBarraSuperior.h"
#import <QuartzCore/QuartzCore.h>
#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>

@interface Mod1Aula3Exe2ViewController : UIViewController

/*==============================VIEWS===============================*/

@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote;
@property (strong, nonatomic) IBOutlet UIView *viewGesturePassaFala;
@property (strong, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (strong, nonatomic) IBOutlet UIView *viewDosRitmos;

//Views para os ritmos
@property (strong, nonatomic) IBOutlet UIImageView *imgBatidasDoCoracao;

@property (strong, nonatomic) IBOutlet UIButton *outBtoClassico;
@property (strong, nonatomic) IBOutlet UIButton *outBtoRock;
@property (strong, nonatomic) IBOutlet UIButton *outBtoSamba;

- (IBAction)btoClassico:(id)sender;
- (IBAction)btoRock:(id)sender;
- (IBAction)btoSamba:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco1;
@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota1;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota3;
@property (strong, nonatomic) IBOutlet UIButton *outBtoTempoVelocidade;
@property (strong, nonatomic) IBOutlet UIButton *outBtoMaestro;
@property (strong, nonatomic) IBOutlet UIButton *outBtoMicrofone;
@property (strong, nonatomic) IBOutlet UIImageView *alternativaCorreta;

- (IBAction)tempoVelocidade:(id)sender;
- (IBAction)maestro:(id)sender;
- (IBAction)microfone:(id)sender;
- (IBAction)tocaTreco1:(id)sender;
- (IBAction)tocaTreco2:(id)sender;


/*===========================ATRIBUTOS=============================*/

//Audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;

//Lista de imagens que precisam de colisao
@property NSMutableArray *listaImangesColisao;

//Auxiliares da Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;

//Auxiliares para liberar fala quando todas as colisoes acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
@property NSString *estadoAux2;
@property NSString *estadoAux3;

@end
