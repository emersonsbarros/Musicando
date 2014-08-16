//
//  Mod2Aula3Exe2ViewController.h
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


@interface Mod2Aula3Exe2ViewController : UIViewController

/*==============================VIEWS===============================*/

//Mascote: Imagem, label e gesture
@property  UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
@property  UIImageView *imagemDoMascote;

@property (strong, nonatomic) IBOutlet UIImageView *escadaDeTons;
@property (strong, nonatomic) IBOutlet UIImageView *pentagrama;

//Notas e mascote da escada
@property (strong, nonatomic) IBOutlet UIImageView *mascote2;
@property (strong, nonatomic) IBOutlet UIImageView *notaDo;
@property (strong, nonatomic) IBOutlet UIImageView *notaRe;
@property (strong, nonatomic) IBOutlet UIImageView *notaMi;
@property (strong, nonatomic) IBOutlet UIImageView *notaFa;
@property (strong, nonatomic) IBOutlet UIImageView *notaSol;
@property (strong, nonatomic) IBOutlet UIImageView *notaLa;
@property (strong, nonatomic) IBOutlet UIImageView *notaSi;


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
