//
//  Mod1Aula2Exe2ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
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

@interface Mod1Aula2Exe2ViewController : UIViewController


@property NSMutableArray *listaImagensColisao;
@property UIView *viewGesturePassaFala;
@property UIImageView *imagemDoMascote2;
@property UILabel *lblFalaDoMascote;
@property  UIView *imgTocaTreco;
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property int contadorDeFalas;


//Atributos para tocar audio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


@property (weak, nonatomic) IBOutlet UIImageView *imgTeclaPiano;
@property (weak, nonatomic) IBOutlet UIImageView *imgApito;
@property (weak, nonatomic) IBOutlet UIImageView *imgTelefone;
@property (weak, nonatomic) IBOutlet UIImageView *imgLeao;
@property (weak, nonatomic) IBOutlet UILabel *lblVisorTocaTreco;
@property (weak, nonatomic) IBOutlet UIImageView *imgFrequencia;



@property (weak, nonatomic) IBOutlet UIImageView *imgGraficoAgudo;
@property (weak, nonatomic) IBOutlet UIImageView *imgGraficoGrave;
@property CGRect posOriginalGrave ;
@property CGRect posOriginalAgudo ;


@property NSMutableArray *listaLiberaFala;
@property NSString *estadoAux1;


@property (weak, nonatomic) IBOutlet UIImageView *imgPilar1Altura;
@property CGRect posOriginalPilar;
@property (weak, nonatomic) IBOutlet UILabel *lblPilar;


@property (weak, nonatomic) IBOutlet UIImageView *imgCristalTimbre;
@property (weak, nonatomic) IBOutlet UIImageView *imgPianoTimbre;
@property (weak, nonatomic) IBOutlet UIImageView *imgViolaoTimbre;
@property (weak, nonatomic) IBOutlet UIImageView *imgCristalTimbrePonto;
@property (weak, nonatomic) IBOutlet UIImageView *imgPianoPonto;
@property (weak, nonatomic) IBOutlet UIImageView *imgViolaoPonto;
@property (weak, nonatomic) IBOutlet UIImageView *imgNotaMusicalCaindo;


@property (weak, nonatomic) IBOutlet UIImageView *imgFrequenciaFlauta;
@property (weak, nonatomic) IBOutlet UIImageView *imgFrequenciaHomen;
@property (weak, nonatomic) IBOutlet UIImageView *imgFrequenciaViolino;
@property (weak, nonatomic) IBOutlet UIImageView *imgFrequenciaDiapasao;


@property (weak, nonatomic) IBOutlet UIImageView *imgMusicaTocar;
@property (weak, nonatomic) IBOutlet UISlider *volume;
- (IBAction)btnVolume:(id)sender;


@property (weak, nonatomic) IBOutlet UIImageView *imgAmplitude;


@property (weak, nonatomic) IBOutlet UIImageView *imgLinhaChegada;
@property (weak, nonatomic) IBOutlet UIImageView *imgTartaruga;
@property (weak, nonatomic) IBOutlet UIImageView *imgCoelho;

@end
