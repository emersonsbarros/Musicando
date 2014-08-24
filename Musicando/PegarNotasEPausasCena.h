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
    
//Nó - Ambiente
    SKNode *piso;

//Nós principais
    SKNode *mascote;
    SKNode *simbolo;
}

//SpriteNodes - Ambiente
@property SKSpriteNode *fundo;
@property SKSpriteNode *pisoPrincipal;

//SpriteNodes - Simbolos, Mascote e botões
@property SKSpriteNode *simboloMusicalPraCair1;
@property SKSpriteNode *simboloMusicalPraCair2;
@property SKSpriteNode *simboloMusicalPraCair3;
@property SKSpriteNode *mascotePrincipal;
@property SKSpriteNode *botaoEsquerda;
@property SKSpriteNode *botaoDireita;

//Labels
@property SKLabelNode *stringDePontuacao;
@property SKLabelNode *labelDePontuacao;
@property SKLabelNode *stringDeSimboloMusical;
@property SKLabelNode *labelDeSimboloMusical;

//Atributos e auxiliares
@property AVAudioPlayer *audioPlayer;
@property NSMutableArray *listaDeSimbolosMusicais;
@property NSMutableArray *listaNomeDosSimbolosMusicais;
@property NSMutableArray *notasJaSorteadas;
@property NSString *simboloMusicalAtual;
@property float densidadeAtual;
@property float gravidadeAtual;
@property int indiceSimboloAtualSorteado;
@property int indiceParaSorteio;
@property int indiceSortearCerto;
@property int estadoPauseJogo;
@property int tempoPercorrido;
@property int auxTempoPercorrido;
@property int pontuacaoJogadorAtual;
@property int quantidadeMovimentoDireita;
@property int quantidadeMovimentoEsquerda;


//MÉTODOS
//Carregamento
-(id)initWithSize:(CGSize)size;
-(void)carregarPrimeirosComponentes;

//Delegate
-(void)update:(CFTimeInterval)currentTime;
-(void)didBeginContact:(SKPhysicsContact *)contact;
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event;

//Sorteios
-(void)sortearSimboloAtual;
-(NSString*)sortearSimboloPraCair;
-(void)sortearSimboloCerto;

//Criação
-(void)simboloPraCair1;
-(void)simboloPraCair2;
-(void)simboloPraCair3;
-(void)criaMascote;
-(void)criaFundo;
-(void)criaPiso;

//Botões
-(SKSpriteNode*)criaBotaoDireita;
-(SKSpriteNode*)criaBotaoEsquerda;

//Animações
-(void)acaoMoverDireita: (SKNode*)node;
-(void)acaoMoverEsquerda: (SKNode*)node;
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow;

//GameOver e Pausa
-(void)gameOver;
-(void)pausaJogo;


@end
