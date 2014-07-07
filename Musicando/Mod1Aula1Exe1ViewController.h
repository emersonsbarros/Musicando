//
//  Mod1Aula1Exe1ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Mod1Aula1Exe1ViewController : UIViewController


@property UILabel *lblTextoDeApresentacao;
@property (weak, nonatomic) IBOutlet UIImageView *imagemDoMascote;
@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote2;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property (weak, nonatomic) IBOutlet UIButton *outBtoStart;
@property (weak, nonatomic) IBOutlet UIButton *outBtoAnimal;
@property (weak, nonatomic) IBOutlet UIButton *outBtoVeiculo;
@property (weak, nonatomic) IBOutlet UIButton *outBtoNota;

- (IBAction)btoStart:(id)sender;
- (IBAction)btoAnimal:(id)sender;
- (IBAction)btoVeiculo:(id)sender;
- (IBAction)btoNota:(id)sender;







@property AVAudioPlayer *audioPlayer;
@property NSURL *caminhoDoAudio;

@end
