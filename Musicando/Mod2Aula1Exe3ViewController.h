//
//  Mod2Aula1Exe3ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Nota.h"
#import "Sinfonia.h"
#import <QuartzCore/QuartzCore.h>
#import "EfeitoImagem.h"
#import "EfeitoMascote.h"
#import <SpriteKit/SpriteKit.h>
#import "BarraSuperiorViewController.h"
#import "EfeitoTransicao.h"
@interface Mod2Aula1Exe3ViewController : UIViewController


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
@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (weak, nonatomic) IBOutlet UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;

//-------------------------------------------------------------------------//


//Atributos para tocar audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


@property (weak, nonatomic) IBOutlet UIImageView *imgEscalaAntiga;
@property (weak, nonatomic) IBOutlet UIImageView *imgEscalaOriginal;
@property (weak, nonatomic) IBOutlet UIImageView *imgMonge;
@property (weak, nonatomic) IBOutlet UIImageView *imgIdeiasmonge;


//Atributos para Animacao chover objetos
@property NSMutableArray *listaImagensCai;

@end
