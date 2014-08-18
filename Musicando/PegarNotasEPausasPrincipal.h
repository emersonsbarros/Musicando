//
//  PegarNotasEPausasPrincipal.h
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameOverViewController.h"

@interface PegarNotasEPausasPrincipal : SKScene{
    
    
    //Nodes
    SKNode *objetoPraCair1;
    SKNode *objetoPraCair2;
    SKNode *objetoPraCair3;
}

//Sprites
@property SKSpriteNode *fundo;
@property SKSpriteNode *mascote;
@property SKSpriteNode *botaoEsquerda;
@property SKSpriteNode *botaoDireita;

//Atributos
@property NSMutableArray *listaDeSimbolosMusicais;

-(SKSpriteNode*)criaBotaoDireita;
-(SKSpriteNode*)criaBotaoEsquerda;



@end
