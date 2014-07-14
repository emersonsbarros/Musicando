//
//  Mod1Aula3Exe1ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Mod1Aula3Exe1ViewController : UIViewController

//Propredades de views ligadas ao xib
@property (strong, nonatomic) IBOutlet UIView *viewDeExercitar;
@property (strong, nonatomic) IBOutlet UIImageView *imgTocaTreco;
@property (strong, nonatomic) IBOutlet UIImageView *imgDoMascote;
@property (strong, nonatomic) IBOutlet UILabel *lblTextoMascote;
@property (strong, nonatomic) IBOutlet UIImageView *imgSeta;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;

@property (strong, nonatomic) IBOutlet UIImageView *imgBlocoDo;
@property (strong, nonatomic) IBOutlet UIImageView *imgBlocoPausa;
@property (strong, nonatomic) IBOutlet UIButton *outBtoStartIntro;
- (IBAction)btoStartIntro:(id)sender;

//Atributos
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;

//Opcoes exercicio
@property (strong, nonatomic) IBOutlet UIButton *outBtoInstrumentos;
@property (strong, nonatomic) IBOutlet UIButton *outBtoCoral;
@property (strong, nonatomic) IBOutlet UIButton *outBtoNotasPausas;
- (IBAction)intrumentos:(id)sender;
- (IBAction)coral:(id)sender;
- (IBAction)notasPausas:(id)sender;

@end
