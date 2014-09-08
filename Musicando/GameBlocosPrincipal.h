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
#import "ExercicioPlayer.h"

//Constantes para colisão
static const UInt32 blocoNotaCorreta = 0x1 << 0;
static const UInt32 pisoCategoria = 0x1 << 1;
static const UInt32 guindasteCategoria = 0x1 << 2;
static const UInt32 tocaTrecoCategoria = 0x1 << 3;
static const UInt32 coluna = 0x1 << 4;

@interface GameBlocosPrincipal : SKScene <SKPhysicsContactDelegate>{
    
//Nós - Ambiente
    SKNode *fundo;
    SKNode *piso;
    
//Nós - TocaTreco e bloco
    SKNode *guindaste;
    SKNode *blocoNota;
    SKNode *botaoCair;
    SKNode *tocaTreco;
    SKNode *corpoParaColisaoDoTocaTreco;
}

//Sprite Nodes - Ambiente
@property SKSpriteNode *fundoPrincipal;
@property SKSpriteNode *pisoPrincipal;

//Sprite Nodes - TocaTreco e bloco
@property SKSpriteNode *guindastePrincipal;
@property SKSpriteNode *blocoNotaPrincipal;
@property SKSpriteNode *botaoCairNota;

@property SKSpriteNode *tocaTrecoPrincipal;
@property SKSpriteNode *coluna1;
@property SKSpriteNode *coluna2;
@property SKSpriteNode *base;

//Labels
@property SKLabelNode *nomeDaNota;
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;

//Auxiliares
@property NSArray *listaDeNotas;
@property double velocidadeGuindaste;
@property int pontuacaoJogadorAtual;
@property int tempoPercorrido;
@property int auxTempoPercorrido;
@property int estadoPauseJogo;
@property int indiceNotaSorteada;
@property BOOL podeCair;


//MÉTODOS
//Carregamento
-(void)carregarPrimeirosComponentes;

//Delegate
-(void)update:(CFTimeInterval)currentTime;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;

//Criação
-(void)criaFundo;
-(void)criaPiso;
-(void)criaGuindaste;
-(void)criaTocaTreco;
-(void)criaBlocoNotaMusical;

//Ações
-(void)sortearNota;
-(void)adionarFisicaAoBlocoMusical;
-(void)cairNota;

//Animações
-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao;
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

//GameOver e Pausa
-(void)gameOver;
-(void)pausaJogo;

@end
