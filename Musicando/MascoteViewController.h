//
//  MascoteViewController.h
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 08/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExercicioImagem.h"
#import "ExercicioMascote.h"
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import "ExercicioTransicao.h"
#import "ExercicioFala.h"

@interface MascoteViewController : UIViewController

//--------------- CODIGO QUE REPETE EM TODAS AS VIEWS ---------------------//
//////////////////Codigo mutavel/////////////////
//lista de todas imagens que precisam de colisao
//Aux Biblioteca
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;
@property SEL metodo;
@property UIViewController *controller;

//Mascote (img,view,label)
@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (weak, nonatomic) IBOutlet UIView *viewGesturePassaFala;

+(MascoteViewController*)sharedManager;
-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;
@property (weak, nonatomic) IBOutlet UIImageView *imgFundoTexto;

-(void)atualizaExericioMascote;

-(void)addGesturePassaFalaMascote:(UIView*)viewGesture :(SEL)metodoPassaFala :(UIViewController*)cont;

@property (weak, nonatomic) IBOutlet UIButton *outBtnAudioFala;

- (IBAction)btnAudioFala:(id)sender;

- (IBAction)btnRepetirFala:(id)sender;

@property BOOL estadoAudioFala;


@end