//
//  JogoScrollMusica.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 15/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PBParallaxScrolling.h"
#import "GameOverViewController.h"
#import "ExercicioPlayer.h"

static const UInt32 mascoteCategory = 0x1 << 0;
static const UInt32 pisoCategory = 0x1 << 1;
static const UInt32 monstroNivel1Category = 0x1 << 2;
static const UInt32 monstroNivel2Category = 0x1 << 3;
static const UInt32 monstroNivel3Category = 0x1 << 4;
static const UInt32 monstroNivel4Category = 0x1 << 5;

@interface JogoScrollMusica : SKScene <SKPhysicsContactDelegate>{
   
}

@property (nonatomic) PBParallaxBackgroundDirection direction;
@property (nonatomic, strong) PBParallaxScrolling * parallaxBackground;
@property SKSpriteNode *man;
@property SKEmitterNode *particulaNotaMascote;
@property SKSpriteNode *piso;
@property SKSpriteNode *btnPula;

@property SKSpriteNode *maicon;
@property SKSpriteNode *gargula;
@property SKSpriteNode *dragao;
@property SKSpriteNode *morte;
@property SKSpriteNode *casa;

@property SKLabelNode *textoDistancia;
@property SKSpriteNode *iconeDistancia;


@property float velocidadeMonstro;
@property int distanciaPercorrida;
@property int AuxdistanciaPercorrida;
@property int sorteaMonstro;
@property int contadorPontos;


@end
