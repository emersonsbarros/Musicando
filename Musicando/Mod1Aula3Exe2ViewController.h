//
//  Mod1Aula3Exe2ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Mod1Aula3Exe2ViewController : UIViewController

//Views para os ritmos
@property (strong, nonatomic) IBOutlet UIView *viewDosRitmos;
@property (strong, nonatomic) IBOutlet UIButton *outBtoClassico;
@property (strong, nonatomic) IBOutlet UIButton *outBtoRock;
@property (strong, nonatomic) IBOutlet UIButton *outBtoSamba;

- (IBAction)btoClassico:(id)sender;
- (IBAction)btoRock:(id)sender;
- (IBAction)btoSamba:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote;
@property (strong, nonatomic) IBOutlet UIButton *outBtoStartIntro;
@property (strong, nonatomic) IBOutlet UILabel *lblTextoMascote;
- (IBAction)btoStartIntro:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco1;
@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota1;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota3;
@property (strong, nonatomic) IBOutlet UIButton *outBtoTempoVelocidade;
@property (strong, nonatomic) IBOutlet UIButton *outBtoMaestro;
@property (strong, nonatomic) IBOutlet UIButton *outBtoMicrofone;

- (IBAction)tempoVelocidade:(id)sender;
- (IBAction)maestro:(id)sender;
- (IBAction)microfone:(id)sender;
- (IBAction)tocaTreco1:(id)sender;
- (IBAction)tocaTreco2:(id)sender;

//Atributos de áudio
@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;


@end
