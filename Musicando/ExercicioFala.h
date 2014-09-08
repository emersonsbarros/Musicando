//
//  EfeitoFala.h
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface ExercicioFala : NSObject

+(ExercicioFala*)sharedManager;

- (void)incializar;
- (void)falar :(NSString*)texto;

-(void)dimunuiSomFala;
-(void)aumentaSomFala;
-(void)stopAudioFala;

@property float nivelVolume;

@end
