//
//  EscadaDeNotasPrincipal.h
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameOver.h"


//CONSTANSTES para colisão
static const UInt32 nota = 0x1 << 0;

static const UInt32 linha = 0x1 << 1;
static const UInt32 espaco = 0x1 << 2;

static const UInt32 piso = 0x1 << 6;
static const UInt32 fundo = 0x1 << 7;


@interface EscadaDeNotasPrincipal : SKScene <SKPhysicsContactDelegate>{
    
    //Ambiente
    SKNode *fundo;
    
    //Nodes
    SKNode *notaMusical;
    SKNode *pentagrama;
    
    SKSpriteNode* activeDragNode;
}

//PROPRIEDADES------

//Sprite Nodes
@property SKSpriteNode *fundoPrincipal;
@property SKSpriteNode *notaMusicalPrincipal;

@property SKSpriteNode *linhaDoPentagrama1;
@property SKSpriteNode *linhaDoPentagrama2;
@property SKSpriteNode *linhaDoPentagrama3;
@property SKSpriteNode *linhaDoPentagrama4;
@property SKSpriteNode *linhaDoPentagrama5;
@property SKSpriteNode *espacoDoPentagrama1;
@property SKSpriteNode *espacoDoPentagrama2;
@property SKSpriteNode *espacoDoPentagrama3;
@property SKSpriteNode *espacoDoPentagrama4;

@property SKSpriteNode *botaoStartAndChek;

//Pontuacao
@property int pontuacaoJogadorAtual;
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;

@property SKLabelNode *stringDeTempo;
@property SKLabelNode *labelDeTempo;



//Auxiliares
@property int estadoPauseJogo;
@property BOOL escalaCerta;

@property NSMutableArray *listaDeNotasComPosicoes;
@property NSArray *listaDeNotas;

@property int indiceNotaSorteada;
@property int quantidadeDeNotas;

@property int tempoPercorrido;
@property int auxTempoPercorrido;


//MÉTODOS-----------


//CARREGAMENTO
-(id)initWithSize:(CGSize)size;
-(void)carregarPrimeirosComponentes;

//UPDATE - Detecta colisão e toque - Animações/sprites
-(void)update:(CFTimeInterval)currentTime;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao;
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

@end
