//
//  EfeitoPlayer.m
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 11/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoPlayer.h"

@implementation EfeitoPlayer



//Singleton
+(EfeitoPlayer*)sharedManager{
    static EfeitoPlayer *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)playAudio:(NSURL*)audio{
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audio error: nil];
    [[self audioPlayer]play];
}

-(void)stopAudio{
    [[self audioPlayer]stop];
}

-(void)ajustaVolume:(float)valor{
    self.audioPlayer.volume = valor;
}

@end
