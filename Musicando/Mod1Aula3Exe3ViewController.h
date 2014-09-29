//
//  Mod1Aula3Exe3ViewController.h
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

@interface Mod1Aula3Exe3ViewController : UIViewController


/*==============================VIEWS===============================*/

@property UIImageView *imagemDoMascote;
@property UIView *viewGesturePassaFala;
@property UILabel *lblFalaDoMascote;
@property (strong, nonatomic) IBOutlet UIView *viewDeExercitar;

//Botões p/ exercitar
@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco1;
@property (strong, nonatomic) IBOutlet UIImageView *vitrola;
@property (strong, nonatomic) IBOutlet UIImageView *notasDeMelodia;

@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco2;
@property (strong, nonatomic) IBOutlet UIButton *outViolaco;
@property (strong, nonatomic) IBOutlet UIButton *outFlauta;
@property (strong, nonatomic) IBOutlet UIButton *outPiano;
@property (strong, nonatomic) IBOutlet UIImageView *alternativaCorreta;

@property (strong, nonatomic) IBOutlet UIImageView *imgNota1;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota3;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota4;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota5;


- (IBAction)tocaTreco1:(id)sender;
- (IBAction)tocaTreco2:(id)sender;
- (IBAction)violao:(id)sender;
- (IBAction)flauta:(id)sender;
- (IBAction)piano:(id)sender;

/*===========================ATRIBUTOS=============================*/

//Audio
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
