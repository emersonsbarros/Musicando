//
//  Mod2Aula4Exe1ViewController.h
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


@interface Mod2Aula4Exe1ViewController : UIViewController

/*==============================VIEWS===============================*/

//Mascote: Imagem, label e gesture
@property  UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
@property  UIImageView *imagemDoMascote;


//Notas
@property (weak, nonatomic) IBOutlet UIImageView *notaSemibreve;
@property (weak, nonatomic) IBOutlet UIImageView *notaMinima;
@property (weak, nonatomic) IBOutlet UIImageView *notaSeminima;
@property (weak, nonatomic) IBOutlet UIImageView *notaColcheia;
@property (weak, nonatomic) IBOutlet UIImageView *notaSemicolheia;
@property (weak, nonatomic) IBOutlet UIImageView *notaFusa;
@property (weak, nonatomic) IBOutlet UIImageView *notaSemifusa;

@property (weak, nonatomic) IBOutlet UIImageView *notaBloco1;
@property (weak, nonatomic) IBOutlet UIImageView *notaBloco2;
@property (weak, nonatomic) IBOutlet UIImageView *notaBloco3;


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
