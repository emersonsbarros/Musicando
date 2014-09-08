//
//  Mod1Aula3Exe1ViewController.h
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

@interface Mod1Aula3Exe1ViewController : UIViewController


/*==============================VIEWS===============================*/


@property UIImageView *imagemDoMascote;
@property UIView *viewGesturePassaFala;
@property  UILabel *lblFalaDoMascote;

@property (strong, nonatomic) IBOutlet UIView *viewDeExercitar;

//Propredades de views ligadas ao xib
@property (strong, nonatomic) IBOutlet UIImageView *tocaTreco;
@property (strong, nonatomic) IBOutlet UIImageView *imgSeta;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;

@property (strong, nonatomic) IBOutlet UIImageView *imgBlocoDo;
@property (strong, nonatomic) IBOutlet UIImageView *imgBlocoPausa;

//Opcoes exercicio
@property (strong, nonatomic) IBOutlet UIButton *outBtoInstrumentos;
@property (strong, nonatomic) IBOutlet UIButton *outBtoCoral;
@property (strong, nonatomic) IBOutlet UIButton *outBtoNotasPausas;
- (IBAction)intrumentos:(id)sender;
- (IBAction)coral:(id)sender;
- (IBAction)notasPausas:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *alternativaCorreta;

@property (strong, nonatomic) IBOutlet UIImageView *imgSilencio;
@property (strong, nonatomic) IBOutlet UIImageView *imgSom;

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
