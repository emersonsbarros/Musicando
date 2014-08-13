//
//  Mod1Aula1Exe1ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
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



@interface Mod1Aula1Exe1ViewController : UIViewController


//--------------- CODIGO QUE REPETE EM TODAS AS VIEWS ---------------------//
//////////////////Codigo mutavel/////////////////
//lista de todas imagens que precisam de colisao
@property NSMutableArray *listaImangesColisao;
//Aux Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
//Mascote (img,view,label)
@property UIImageView *imagemDoMascote2;
@property  UILabel *lblFalaDoMascote;
@property UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;
//-------------------------------------------------------------------------//



//Toca Treco
@property UIImageView *imgTocaTreco;
- (IBAction)btnAlavancaTocaTreco:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outAlavancaTocaTreco;



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






@end
