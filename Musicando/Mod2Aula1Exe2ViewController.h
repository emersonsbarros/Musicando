//
//  Mod2Aula1Exe2ViewController.h
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



@interface Mod2Aula1Exe2ViewController : UIViewController


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
@property  UIImageView *imagemDoMascote2;
@property  UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
//Auxilia para liberar a fala qd todas as colisoes que vc quer acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;

//-------------------------------------------------------------------------//


//Atributos para tocar audio
@property NSURL *caminhoDoAudio;



@property (weak, nonatomic) IBOutlet UIImageView *imgEscala;


@property (weak, nonatomic) IBOutlet UIView *viewCacaPalavras;
@property (weak, nonatomic) IBOutlet UIImageView *gestureDo;
@property (weak, nonatomic) IBOutlet UIImageView *gestureRe;
@property (weak, nonatomic) IBOutlet UIImageView *gestureMi;
@property (weak, nonatomic) IBOutlet UIImageView *gestureFa;
@property (weak, nonatomic) IBOutlet UIImageView *gestureSol;
@property (weak, nonatomic) IBOutlet UIImageView *gestureLa;
@property (weak, nonatomic) IBOutlet UIImageView *gestureSi;
@property int auxContaCacaPalavras;
@property int auxContaErradoCacaPalavras;
@property (weak, nonatomic) IBOutlet UILabel *txtGameOver;
@property (weak, nonatomic) IBOutlet UILabel *txtAcerto;
@property (weak, nonatomic) IBOutlet UILabel *txtErros;



@property (weak, nonatomic) IBOutlet UIView *viewPlaquinhas;

@property (weak, nonatomic) IBOutlet UIImageView *pontoDo;
@property (weak, nonatomic) IBOutlet UIImageView *pontoRe;
@property (weak, nonatomic) IBOutlet UIImageView *pontoMi;
@property (weak, nonatomic) IBOutlet UIImageView *pontoFa;
@property (weak, nonatomic) IBOutlet UIImageView *pontoSol;
@property (weak, nonatomic) IBOutlet UIImageView *pontoLa;
@property (weak, nonatomic) IBOutlet UIImageView *pontoSi;

@property (weak, nonatomic) IBOutlet UILabel *placaDo;
@property (weak, nonatomic) IBOutlet UILabel *placaRe;
@property (weak, nonatomic) IBOutlet UILabel *placaMi;
@property (weak, nonatomic) IBOutlet UILabel *placaFa;
@property (weak, nonatomic) IBOutlet UILabel *placaSol;
@property (weak, nonatomic) IBOutlet UILabel *placaLa;
@property (weak, nonatomic) IBOutlet UILabel *placaSi;


@property (weak, nonatomic) IBOutlet UIImageView *imgMaoGesture;
@property (weak, nonatomic) IBOutlet UILabel *txtMaoGesture;

@property (weak, nonatomic) IBOutlet UIView *viewTocaTreco;
@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;
@property (weak, nonatomic) IBOutlet UILabel *txtNomeNota;
@property CGRect posOriginalNomeNota;
@property NSArray *listaNomeNotas;
@property int indiceListaNomeNotas;
@property NSMutableArray *listaSons;





@end






