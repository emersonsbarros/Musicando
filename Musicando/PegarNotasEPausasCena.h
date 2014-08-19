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

//CONSTANSTES para colisão
static const UInt32 simboloMusicalCorreto = 0x1 << 0;

static const UInt32 mascoteCategoria = 0x1 << 1;
static const UInt32 pisoCategoria = 0x1 << 2;

@interface PegarNotasEPausasCena : SKScene <SKPhysicsContactDelegate>{
    
    SKNode *piso;
    SKNode *mascote;
    SKNode *simbolo;
}

//Sprites & Nodes
@property SKSpriteNode *simboloMusicalPraCair1;
@property SKSpriteNode *simboloMusicalPraCair2;
@property SKSpriteNode *simboloMusicalPraCair3;

@property SKSpriteNode *fundo;
@property SKSpriteNode *pisoPrincipal;
@property SKSpriteNode *mascotePrincipal;
@property SKSpriteNode *botaoEsquerda;
@property SKSpriteNode *botaoDireita;

//Labels
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;
@property SKLabelNode *stringDeSimboloMusical;
@property SKLabelNode *labelDeSimboloMusical;

//Atributos e auxiliares
@property NSMutableArray *listaDeSimbolosMusicais;
@property NSMutableArray *listaNomeDosSimbolosMusicais;

@property NSString *simboloMusicalAtual;
@property float densidadeAtual;

@property int indiceSimboloAtualSorteado;
@property int indiceParaSorteio;
@property int indiceSortearCerto;

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

-(void)removerDaCena: (SKSpriteNode*)node;

-(void)acaoMoverDireita: (SKNode*)node;
-(void)acaoMoverEsquerda: (SKNode*)node;

-(void)update:(CFTimeInterval)currentTime;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;

-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

-(void)gameOver;
-(void)pausaJogo;


@end
