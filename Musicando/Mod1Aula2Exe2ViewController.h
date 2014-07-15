//
//  Mod1Aula2Exe2ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import "EfeitoMascote.h"
#import "EfeitoImagem.h"
#import <UIKit/UIKit.h>

@interface Mod1Aula2Exe2ViewController : UIViewController


@property NSMutableArray *listaImagensColisao;
@property (weak, nonatomic) IBOutlet UIView *viewGesturePassaFala;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;

@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;


@property (weak, nonatomic) IBOutlet UIImageView *imgTeclaPiano;
@property (weak, nonatomic) IBOutlet UIImageView *imgApito;
@property (weak, nonatomic) IBOutlet UIImageView *imgTelefone;
@property (weak, nonatomic) IBOutlet UIImageView *imgLeao;
@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;
@property (weak, nonatomic) IBOutlet UILabel *lblVisorTocaTreco;


@property (weak, nonatomic) IBOutlet UIImageView *imgGraficoAgudo;
@property (weak, nonatomic) IBOutlet UIImageView *imgGraficoGrave;
@property CGRect posOriginalGrave ;
@property CGRect posOriginalAgudo ;


@end
