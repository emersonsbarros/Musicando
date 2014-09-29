//
//  GameBlocosViewController.h
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 11/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "GameBlocosPrincipal.h"
#import "GameOverViewController.h"
#import "Biblioteca.h"
#import <QuartzCore/QuartzCore.h>
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
#import "GameOverViewController.h"


@interface GameBlocosViewController : UIViewController

//--------------- CODIGO QUE REPETE EM TODAS AS VIEWS ---------------------//
//////////////////Codigo mutavel/////////////////

//Aux Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;

//Mascote (img,view,label)
@property UIImageView *imagemDoMascote2;
@property  UILabel *lblFalaDoMascote;
@property UIView *viewGesturePassaFala;
@property UIView *imgTocaTreco;

@property (strong, nonatomic) IBOutlet UIImageView *tocaTreco;

//-------------------------------------------------------------------------//

@end
