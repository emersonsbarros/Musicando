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
#import <QuartzCore/QuartzCore.h>
#import "EfeitoImagem.h"
#import "EfeitoMascote.h"
#import <SpriteKit/SpriteKit.h>
#import "BarraSuperiorViewController.h"
#import "MascoteViewController.h"
#import "RetornaPaginaViewController.h"
#import "EfeitoTransicao.h"
#import "EfeitoPlayer.h"



@interface Mod1Aula1Exe1ViewController : UIViewController <UIGestureRecognizerDelegate>

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
@property NSString *estadoAux2;
@property NSString *estadoAux3;
//-------------------------------------------------------------------------//



//Toca Treco
@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;
- (IBAction)btnAlavancaTocaTreco:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outAlavancaTocaTreco;
@property float lastRotation;
@property NSURL *caminhoDoAudio;


//Imagens para Colisao
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaGalo;
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaCarro;
@property (weak, nonatomic) IBOutlet UIImageView *imgFitaFuracao;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica3;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica2;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjetoMusica1;


//Imagens que fazem animacao sem colisao
@property (weak, nonatomic) IBOutlet UIImageView *imgGaloGrande;
@property (weak, nonatomic) IBOutlet UIImageView *imgPipaGrande;
@property (weak, nonatomic) IBOutlet UIImageView *imgCarroGrande;


//Intro gesture de como passar fala
- (IBAction)btnComecar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outBtnComecar;

@property (weak, nonatomic) IBOutlet UIView *viewInicialGesture;
@property (weak, nonatomic) IBOutlet UIImageView *imgMaoTouch;
@property (weak, nonatomic) IBOutlet UIImageView *imgMascoteIntro;
@property (weak, nonatomic) IBOutlet UIImageView *imgMaoTocaTreco;
@property (weak, nonatomic) IBOutlet UIImageView *imgGaloMao;



//Beneficios Musica
@property (weak, nonatomic) IBOutlet UIImageView *imgBen1;
@property (weak, nonatomic) IBOutlet UIImageView *imgBen2;
@property (weak, nonatomic) IBOutlet UIImageView *imgBen3;


//Movimento cultural
@property (weak, nonatomic) IBOutlet UIImageView *imgIndioMusica;
@property (weak, nonatomic) IBOutlet UIImageView *imgAnimacaoIndio;



@property (weak, nonatomic) IBOutlet UIImageView *imgCarnaval;
@property (weak, nonatomic) IBOutlet UIImageView *imgAnimacaoCarnaval;



@property (weak, nonatomic) IBOutlet UIImageView *imgCapoeiraMusica;
@property (weak, nonatomic) IBOutlet UIImageView *imgAnimacaoCapoeira;


//Atributos para Animacao chover objetos
@property NSMutableArray *listaSons;
@property CGFloat posX;
@property float delay;
@property float duracao;
@property NSMutableArray *listaImagensCai;





@end
