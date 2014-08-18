//
//  EfeitoFala.m
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// Neither the name of Keith Harrison nor the names of its contributors
// may be used to endorse or promote products derived from this software
// without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ''AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "EfeitoFala.h"
#import <AVFoundation/AVFoundation.h>

@interface EfeitoFala () <AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) NSArray *languageCodes;
@property (strong, nonatomic) NSDictionary *languageDictionary;
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property AVSpeechUtterance *utterance;

typedef NS_ENUM(NSInteger, UYLSpeedControlIndex)
{
    UYLSpeedControlQuarterSpeed = 0,
    UYLSpeedControlHalfSpeed = 1,
    UYLSpeedControlNormalSpeed = 2,
    UYLSpeedControlDoubleSpeed = 3
};

typedef NS_ENUM(NSInteger, UYLPitchControlIndex)
{
    UYLPitchControlDeepPitch = 0,
    UYLPitchControlNormalPitch = 1,
    UYLPitchControlHighPitch = 2
};

@property (assign, nonatomic) UYLSpeedControlIndex selectedSpeed;
@property (assign, nonatomic) UYLPitchControlIndex selectedPitch;
@property (strong, nonatomic) NSString *selectedLanguage;

@property (strong, nonatomic) NSString *restoredTextToSpeak;

@end

@implementation EfeitoFala

NSString *UYLPrefKeySelectedSpeed = @"UYLPrefKeySelectedSpeed";
NSString *UYLPrefKeySelectedPitch = @"UYLPrefKeySelectedPitch";
NSString *UYLPrefKeySelectedLanguage = @"UYLPrefKeySelectedLanguage";
NSString *UYLKeySpeechText = @"UYLKeySpeechText";


//Singleton
+(EfeitoFala*)sharedManager{
    static EfeitoFala *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        self.nivelVolume = 5.0;
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


// Language codes used to create custom voices. Array is sorted based
// on the display names in the language dictionary
- (NSArray *)languageCodes
{
    if (!_languageCodes)
    {
        _languageCodes = [self.languageDictionary keysSortedByValueUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return _languageCodes;
}


// Map between language codes and locale specific display name
- (NSDictionary *)languageDictionary
{
    if (!_languageDictionary)
    {
        NSArray *voices = [AVSpeechSynthesisVoice speechVoices];
        NSArray *languages = [voices valueForKey:@"language"];
        
        NSLocale *currentLocale = [NSLocale autoupdatingCurrentLocale];
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        for (NSString *code in languages)
        {
            dictionary[code] = [currentLocale displayNameForKey:NSLocaleIdentifier value:code];
        }
        _languageDictionary = dictionary;
    }
    return _languageDictionary;
}

- (AVSpeechSynthesizer *)synthesizer
{
    if (!_synthesizer)
    {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        _synthesizer.delegate = self;
    }
    return _synthesizer;
}


- (void)incializar{

    //Velocidade
    [self selecionarAltura: 2]; //2 = High
    [self selecionarVelocidade: 1]; //1 = 0.5
    [self selecionarLinguagem: 26];
    
}

-(void)aumentaSomFala{
    self.nivelVolume = 5.0;
    
    
}

-(void)dimunuiSomFala{
    [_synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@""];
    [_synthesizer speakUtterance:utterance];
    [_synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    
     self.nivelVolume = 0.0;
}


//LINGUAGEM
- (void)selecionarLinguagem: (int)indiceDaLinguagem{
    self.selectedLanguage = [self.languageCodes objectAtIndex: indiceDaLinguagem];
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setObject:self.selectedLanguage forKey:UYLPrefKeySelectedLanguage];
    [preferences synchronize];
}

//VELOCIDADE
- (void)selecionarVelocidade: (int)indiceDeVelocidade{
    
    self.selectedSpeed = indiceDeVelocidade;
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setInteger:self.selectedSpeed forKey:UYLPrefKeySelectedSpeed];
    [preferences synchronize];
}

//ALTURA
- (void)selecionarAltura: (int)indiceDeAltura{
    
    self.selectedPitch = indiceDeAltura;
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    [preferences setInteger:self.selectedPitch forKey:UYLPrefKeySelectedPitch];
    [preferences synchronize];
}

//FALAR
- (void)falar :(NSString*)texto{
    
    if (texto && !self.synthesizer.isSpeaking){
        
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:self.selectedLanguage];
        _utterance = [[AVSpeechUtterance alloc] initWithString: texto];
        _utterance.voice = voice;
        _utterance.volume = self.nivelVolume;
    
        
        //Velocidade
        float adjustedRate = AVSpeechUtteranceDefaultSpeechRate * [self rateModifier];
        
        if (adjustedRate > AVSpeechUtteranceMaximumSpeechRate){
            adjustedRate = AVSpeechUtteranceMaximumSpeechRate;
        }
        
        if (adjustedRate < AVSpeechUtteranceMinimumSpeechRate){
            adjustedRate = AVSpeechUtteranceMinimumSpeechRate;
        }
        
        _utterance.rate = adjustedRate;
        
        //Altura
        float pitchMultiplier = [self pitchModifier];
        if ((pitchMultiplier >= 0.5) && (pitchMultiplier <= 2.0))
        {
            _utterance.pitchMultiplier = pitchMultiplier;
        }
        
        [self.synthesizer speakUtterance:_utterance];
    }
}

//Velocidade
- (float)rateModifier
{
    float rate = 1.0;
    switch (self.selectedSpeed)
    {
        case UYLSpeedControlQuarterSpeed:
            rate = 0.25;
            break;
        case UYLSpeedControlHalfSpeed:
            rate = 0.5;
            break;
        case UYLSpeedControlNormalSpeed:
            rate = 1.0;
            break;
        case UYLSpeedControlDoubleSpeed:
            rate = 2.0;
            break;
        default:
            rate = 1.0;
            break;
    }
    return rate;
}

//Altura
- (float)pitchModifier
{
    float pitch = 1.0;
    switch (self.selectedPitch)
    {
        case UYLPitchControlDeepPitch:
            pitch = 0.75;
            break;
        case UYLPitchControlNormalPitch:
            pitch = 1.0;
            break;
        case UYLPitchControlHighPitch:
            pitch = 1.5;
            break;
        default:
            pitch = 1.0;
            break;
    }
    return pitch;
}


- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance
{
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString: self.textInput.text];
//    [text addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:characterRange];
//    self.textInput.attributedText = text;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:self.textInput.attributedText];
//    [text removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [text length])];
//    self.textInput.attributedText = text;
}







@end
