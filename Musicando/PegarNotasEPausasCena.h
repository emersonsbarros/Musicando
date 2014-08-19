//
//  PegarNotasEPausasCena.h
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "GameOverViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface PegarNotasEPausasCena : SKScene <SKPhysicsContactDelegate>{
    
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

//Labels
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;

//Atributos e auxiliares
@property NSMutableArray *listaDeSimbolosMusicais;
@property int indiceSimboloSorteado;

@property int estadoPauseJogo;
@property int tempoPercorrido;
@property int auxTempoPercorrido;
@property int pontuacaoJogadorAtual;

//Movimentos
@property int quantidadeMovimentoDireita;
@property int quantidadeMovimentoEsquerda;

//Botoes
-(SKSpriteNode*)criaBotaoDireita;
-(SKSpriteNode*)criaBotaoEsquerda;

-(void)carregarPrimeirosComponentes;

-(void)criaMascote;
-(void)criaFundo;

-(void)acaoMoverDireita: (SKNode*)node;
-(void)acaoMoverEsquerda: (SKNode*)node;

-(void)update:(CFTimeInterval)currentTime;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;

-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

-(void)gameOver;
-(void)pausaJogo;


@end
