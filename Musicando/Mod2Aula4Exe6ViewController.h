
//
//  Mod2Aula4Exe5ViewController.h
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

@interface Mod2Aula4Exe6ViewController : UIViewController

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
@property UIImageView *imagemDoMascote2;
@property  UILabel *lblFalaDoMascote;
@property UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
//-------------------------------------------------------------------------//

//Atributos para tocar audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


@property (weak, nonatomic) IBOutlet UIImageView *pilar3;
@property (weak, nonatomic) IBOutlet UIImageView *base;

@property (weak, nonatomic) IBOutlet UIImageView *imgPausa4TemposIntro;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausa2TemposIntro;
@property (weak, nonatomic) IBOutlet UIImageView *imgPentagrama;



@property (weak, nonatomic) IBOutlet UIImageView *imgPausa1Tempo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausa05Tempo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausa025Tempo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausa0125Tempo;
@property (weak, nonatomic) IBOutlet UIImageView *imgPausa0012Tempo;


@property (weak, nonatomic) IBOutlet UILabel *lbl1Tempo;
@property (weak, nonatomic) IBOutlet UILabel *lbl12Tempo;
@property (weak, nonatomic) IBOutlet UILabel *lbl14Tempo;
@property (weak, nonatomic) IBOutlet UILabel *lbl18Tempo;
@property (weak, nonatomic) IBOutlet UILabel *lbl16Tempo;


@property (weak, nonatomic) IBOutlet UIView *viewAssociaNomeNotas;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto4tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto2tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto1tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto14tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto12tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto18tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgPonto116tempos;

@property (weak, nonatomic) IBOutlet UIImageView *imgColisao4Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao2Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao1Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao14Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao12Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao18Tempos;
@property (weak, nonatomic) IBOutlet UIImageView *imgColisao32Tempos;



@end







