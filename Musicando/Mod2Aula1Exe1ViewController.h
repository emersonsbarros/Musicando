//
//  Mod2Aula1Exe1ViewController.h
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

@interface Mod2Aula1Exe1ViewController : UIViewController {
    
}

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
@property UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
//-------------------------------------------------------------------------//

//Atributos para tocar audio
@property NSURL *caminhoDoAudio;


@property (weak, nonatomic) IBOutlet UIImageView *imgPassaroParitura;


@property NSMutableArray *listaSons;
- (IBAction)btnDo:(id)sender;
- (IBAction)btnRe:(id)sender;
- (IBAction)btnMi:(id)sender;
- (IBAction)btnFa:(id)sender;
- (IBAction)btnSo:(id)sender;
- (IBAction)btnLa:(id)sender;
- (IBAction)btnSi:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outDo;
@property (weak, nonatomic) IBOutlet UIButton *outRe;
@property (weak, nonatomic) IBOutlet UIButton *outMi;
@property (weak, nonatomic) IBOutlet UIButton *outFa;
@property (weak, nonatomic) IBOutlet UIButton *outSo;
@property (weak, nonatomic) IBOutlet UIButton *outLa;
@property (weak, nonatomic) IBOutlet UIButton *outSi;


@property (weak, nonatomic) IBOutlet UIView *viewPiano;


@property (weak, nonatomic) IBOutlet UIImageView *pilar1;
@property (weak, nonatomic) IBOutlet UIImageView *pilar2;
@property (weak, nonatomic) IBOutlet UIImageView *pilar3;
@property (weak, nonatomic) IBOutlet UIImageView *pilar4;
@property (weak, nonatomic) IBOutlet UIImageView *base;



@property (weak, nonatomic) IBOutlet UIImageView *imgEscada;
@property (weak, nonatomic) IBOutlet UIView *viewEscada;


@property (weak, nonatomic) IBOutlet UIImageView *imgBandeira;
@property (weak, nonatomic) IBOutlet UILabel *lblPadraoAmericano;




@end







