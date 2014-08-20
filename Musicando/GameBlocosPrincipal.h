//
//  GameBlocosPrincipal.h
//  Musicando
//
//  Created by Emerson Barros on 11/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameOverViewController.h"

//Constantes para colisão
static const UInt32 blocoNotaCorreta = 0x1 << 0;
static const UInt32 pisoCategoria = 0x1 << 1;
static const UInt32 guindasteCategoria = 0x1 << 2;

static const UInt32 tocaTrecoCategoria = 0x1 << 3;
static const UInt32 coluna = 0x1 << 4;



@interface GameBlocosPrincipal : SKScene <SKPhysicsContactDelegate>{
    
    //Ambiente
    SKNode *fundo;
    SKNode *piso;
    
    //Guindaste, tocaTreco e bloco
    SKNode *guindaste;
    SKNode *tocaTreco;
    SKNode *corpoParaColisaoDoTocaTreco;
    SKNode *blocoNota;
    
    SKNode *botaoCair;
}

//Sprite Nodes
@property SKSpriteNode *fundoPrincipal;
@property SKSpriteNode *pisoPrincipal;
@property SKSpriteNode *guindastePrincipal;

@property SKSpriteNode *coluna1;
@property SKSpriteNode *coluna2;
@property SKSpriteNode *base;
@property SKSpriteNode *tocaTrecoPrincipal;

@property SKSpriteNode *blocoNotaPrincipal;
@property SKSpriteNode *botaoCairNota;
@property SKLabelNode *nomeDaNota;

//Pontuacao
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;

@property AVAudioPlayer *audioPlayer;

//Auxiliares
@property int pontuacaoJogadorAtual;
@property int tempoPercorrido;
@property int auxTempoPercorrido;
@property int estadoPauseJogo;
@property double velocidadeGuindaste;
@property NSArray *listaDeNotas;
@property int indiceNotaSorteada;

@property BOOL podeCair;

//Métodos
-(void)carregarPrimeirosComponentes;

-(void)criaBlocoNotaMusical;

-(void)criaGuindaste;
-(void)criaTocaTreco;

-(void)criaPiso;
-(void)criaFundo;

-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao;

-(void)update:(CFTimeInterval)currentTime;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

@end
