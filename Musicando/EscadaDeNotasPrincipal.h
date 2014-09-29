//
//  EscadaDeNotasPrincipal.h
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import <SpriteKit/SpriteKit.h>
#import "GameOverViewController.h"
#import "EfeitoPlayer.h"

//CONSTANSTES para colisão
static const UInt32 nota = 0x1 << 0;
static const UInt32 linha = 0x1 << 1;
static const UInt32 espaco = 0x1 << 2;
static const UInt32 piso = 0x1 << 6;
static const UInt32 fundo = 0x1 << 7;

@interface EscadaDeNotasPrincipal : SKScene <SKPhysicsContactDelegate>{
    
//Nós - Ambiente
    SKNode *fundo;
    
//Nós - Nota, pentagrama e active (usado para gesture nas notas)
    SKNode *notaMusical;
    SKNode *pentagrama;
    SKSpriteNode* activeDragNode;
}

//Sprite Nodes - Ambiente
@property SKSpriteNode *fundoPrincipal;
@property SKSpriteNode *notaMusicalPrincipal;

//Sprite Nodes - Pentagrama
@property SKSpriteNode *linhaDoPentagrama1;
@property SKSpriteNode *linhaDoPentagrama2;
@property SKSpriteNode *linhaDoPentagrama3;
@property SKSpriteNode *linhaDoPentagrama4;
@property SKSpriteNode *linhaDoPentagrama5;
@property SKSpriteNode *linhaDoPentagrama6;
@property SKSpriteNode *espacoDoPentagrama1;
@property SKSpriteNode *espacoDoPentagrama2;
@property SKSpriteNode *espacoDoPentagrama3;
@property SKSpriteNode *espacoDoPentagrama4;

//Botões
@property SKSpriteNode *botaoStartAndChek;

//Labels
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;
@property SKLabelNode *stringDeTempo;
@property SKLabelNode *labelDeTempo;

//Auxiliares
@property NSMutableArray *listaDeNotasComPosicoes;
@property NSArray *listaDeNotas;
@property int estadoPauseJogo;
@property int tempoPercorrido;
@property int auxTempoPercorrido;
@property int pontuacaoJogadorAtual;
@property int indiceNotaSorteada;
@property int quantidadeDeNotas;
@property int ultimaQuantidadeSorteada;
@property BOOL tempoEncerrado;
@property BOOL escalaCerta;


//MÉTODOS
//Carregamento
-(id)initWithSize:(CGSize)size;
-(void)carregarPrimeirosComponentes;

//Delegate
-(void)update:(CFTimeInterval)currentTime;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

//Animações
-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao;
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

//Criação
-(void)criaFundo;
-(void)sortearQuantidadeDeNotas;
-(void)criaNotasMusicais;
-(void)criaPentagrama;
-(void)criaBotaoStarAndCheck;

//GameOver e Pausa
-(void)gameOver;
-(void)pausaJogo;

@end
