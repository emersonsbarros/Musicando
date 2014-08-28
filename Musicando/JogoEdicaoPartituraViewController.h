//
//  JogoEdicaoPartituraViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 17/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
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
#import "ComposicaoPartituraViewController.h"
#import "GameOverViewController.h"
#import "DesenhaPartitura.h"

@interface JogoEdicaoPartituraViewController : UIViewController

/*==============================VIEWS===============================*/

//Mascote: Imagem, label e gesture
@property  UILabel *lblFalaDoMascote;
@property  UIView *viewGesturePassaFala;
@property  UIImageView *imagemDoMascote;

//Auxiliares da Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;

//Auxiliares para liberar fala quando todas as colisoes acontecerem
@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;

@property ComposicaoPartituraViewController *compor;


@property NSMutableArray *listaEdicaoUsuario;

@property Nota *notaUsuario;
@property Nota *notaSimulada;

@property (weak, nonatomic) IBOutlet UILabel *lblnomeNota;
@property (weak, nonatomic) IBOutlet UILabel *lblTempoNota;
@property (weak, nonatomic) IBOutlet UILabel *lblTipo;
@property (weak, nonatomic) IBOutlet UIView *viewSimulador;

@property NSString *nomeNota;
@property NSString *tempoNota;
@property NSString *tipo;

@property int contadorPontos;
@property (weak, nonatomic) IBOutlet UILabel *lblPontuacao;

- (IBAction)btnHome:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outBtnHome;




@end
