//
//  EfeitoPlayer.h
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 11/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface EfeitoPlayer : NSObject


+(EfeitoPlayer*)sharedManager;


@property AVAudioPlayer *somExercicioPlayer;
@property AVAudioPlayer *backGroundPrincipalPlayer;


@property NSURL *caminhoDoAudio;

-(void)playAudio:(NSURL*)audio;
-(void)stopAudio;
-(void)ajustaVolume:(float)valor;
-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes;
-(void)playAudio:(NSURL*)audio :(int)qtdRepeticoes :(float)volume;
-(void)mudaVolume:(float)volume;
-(void)playAudios;
-(void)initPlayer:(NSURL*)audio;

@end
