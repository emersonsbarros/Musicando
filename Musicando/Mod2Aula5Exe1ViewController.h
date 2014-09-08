//
//  Mod2Aula5Exe1ViewController.h
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

@interface Mod2Aula5Exe1ViewController : UIViewController

/*==============================VIEWS===============================*/

//Mascote: Imagem, label e gesture
@property  UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
@property  UIImageView *imagemDoMascote;

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
