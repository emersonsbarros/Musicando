//
//  PegarNotasEPausasCena.m
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "PegarNotasEPausasCena.h"
#define GRAVIDADE_MUNDO -10


@implementation PegarNotasEPausasCena

-(id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize: size]){
        
        //Configura física do mundo
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, GRAVIDADE_MUNDO);
        
        //Inicia zerado auxiliar para pausa, contadores de tempo e pontuação
        self.estadoPauseJogo = 0;
        
        self.tempoPercorrido = 0;
        self.auxTempoPercorrido = 0;
        self.pontuacaoJogadorAtual = 0;
        
        //Inicia lista de notas e indice para sorteio
        self.listaDeSimbolosMusicais = [[NSMutableArray alloc] initWithObjects: @"Do", @"Re", @"Mi", @"Fa", @"Sol", @"La", @"Si", @"P4", @"P2", @"P1", @"P12", @"P14", @"P18", @"P16", nil];
        self.indiceSimboloSorteado = 0;
        self.quantidadeMovimentoEsquerda = 1;
        self.quantidadeMovimentoDireita = 1;
        
        //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
    }
    
    return self;
}



-(void)carregarPrimeirosComponentes{
    
//Ambiente
    [self criaFundo];
    [self criaPiso];
    [self criaMascote];
    
//Botoes
    [self addChild: [self criaBotaoDireita]];
    [self addChild: [self criaBotaoEsquerda]];
    
//Configura as labels de pontuação
    self.stringDePontuacao = [[SKLabelNode alloc]init];
    self.stringDePontuacao.fontColor = [UIColor blackColor];
    self.stringDePontuacao.fontSize = 50.0f;
    self.stringDePontuacao.position = CGPointMake(800, 700);
    self.stringDePontuacao.zPosition = 2;
    self.stringDePontuacao.text = @"Pontuação: ";
    self.stringDePontuacao.fontName = @"Marker Felt Thin";
    [self addChild: self.stringDePontuacao];
    
    self.labelDePontuacao = [[SKLabelNode alloc]init];
    self.labelDePontuacao.fontColor = [UIColor blackColor];
    self.labelDePontuacao.fontSize = 50.0f;
    self.labelDePontuacao.position = CGPointMake(940, 700);
    self.labelDePontuacao.zPosition = 2;
    self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
    self.labelDePontuacao.fontName = @"Marker Felt Thin";
    [self addChild: self.labelDePontuacao];
}


/////////////////////////////////////////////////////// UPDATE DO TEMPO ////////////////////////////////////////////////////////

-(void)update:(CFTimeInterval)currentTime{
}



/////////////////////////////////////////////////////// COLISÃO ////////////////////////////////////////////////////////
-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    SKPhysicsBody *primeiroCorpoFisico;
    SKPhysicsBody *segundoCorpoFisico;
    
    //Padrão delegate
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
        primeiroCorpoFisico = contact.bodyA;
        segundoCorpoFisico = contact.bodyB;
    }
    else{
        primeiroCorpoFisico = contact.bodyB;
        segundoCorpoFisico = contact.bodyA;
    }
    
}


/////////////////////////////////////////////////////// TOQUES ////////////////////////////////////////////////////////
//CHAMADO QUANDO HÁ UM TOQUE NA TELA
-(void)touchesBegan:(NSSet*)touches withEvent: (UIEvent*)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint: location];
    
//Botão direita
    if ([node.name isEqualToString:@"botaoDireita"]) {
        
        //Ate 2 movimentos
        if (self.quantidadeMovimentoDireita < 2) {
            [self acaoMoverDireita: _mascote];
            self.quantidadeMovimentoDireita++;
            
            if(self.quantidadeMovimentoEsquerda != 0)
                self.quantidadeMovimentoEsquerda--;
        }    }
    
//Botão esquerda
    if ([node.name isEqualToString:@"botaoEsquerda"]) {
        
        //Ate 2 movimentos
        if (self.quantidadeMovimentoEsquerda < 2) {
            [self acaoMoverEsquerda: _mascote];
            self.quantidadeMovimentoEsquerda++;
            
            if(self.quantidadeMovimentoDireita != 0)
                self.quantidadeMovimentoDireita--;
        }
    }
    
}


//////////////////////////////// CRIAÇAO ////////////////////////////////////////////
-(void)criaMascote{
    
//Incia
    _mascote = [[SKSpriteNode alloc] init];
    _mascote.position = CGPointMake(512, 100);
    _mascote.zPosition = 2;
    _mascote.name = @"mascote";
    
//Posicao e img
    SKTexture *textura = [SKTexture textureWithImageNamed: @"mascote.png"];
    _mascote.texture = textura;
    _mascote.size = CGSizeMake(100, 100);
    
//Cria o corpo físico do bloco
    _mascote.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(100, 100)];
    _mascote.physicsBody.dynamic = YES;
    _mascote.physicsBody.affectedByGravity = NO;
    _mascote.physicsBody.density = 0.2f;
    _mascote.physicsBody.usesPreciseCollisionDetection = YES;
    _mascote.physicsBody.restitution = 0;
    
//Colisao
    _mascote.physicsBody.categoryBitMask = mascote;
    _mascote.physicsBody.contactTestBitMask = simboloMusical;
    
//Adiciona a textura ao nó e o nó a cena
    [self addChild: _mascote];
    
}

//FUNDO
-(void)criaFundo{
    
//Aloca, seta nome e posição do nó
    self.fundo = [[SKSpriteNode alloc] init];
    self.fundo.name = @"fundo";
    self.fundo.position  = CGPointMake(512, 384);
    
//Cria textura
    SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"papelAntigo.jpg"];
    self.fundo.texture = texturaFundoPrincipal;
    self.fundo.size = CGSizeMake(1024, 768);
    self.fundo.zPosition = -5;
    
//Adiciona a textura ao nó e o nó a cena
    [self addChild: self.fundo];
}

//PISO
-(void)criaPiso{
    
//Aloca, seta nome e tamanho do nó
    self.piso = [[SKSpriteNode alloc]init];
    self.piso.name = @"piso";
    self.piso.position = CGPointMake(300, -60);
    
//Cria testura do piso
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed: @"chao.png"];
    self.piso.texture = texturaPiso;
    self.piso.size = CGSizeMake(1200, 50);
    
//Cria o corpo físico do piso
    self.piso.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(1200, 50)];
    self.piso.physicsBody.dynamic = NO;
    self.piso.physicsBody.affectedByGravity = NO;
    self.piso.physicsBody.allowsRotation = NO;
    self.piso.physicsBody.density = 0.6f;
    self.piso.physicsBody.restitution = 0;
    
//Configuração colisão do corpo físico do piso
    self.piso.physicsBody.categoryBitMask = piso;
    self.piso.physicsBody.contactTestBitMask = simboloMusical;
    
//Adiciona a textura ao nó, e o nó a cena
    [self addChild: self.piso];
}

-(SKSpriteNode*)criaBotaoDireita{
    
    _botaoDireita = [[SKSpriteNode alloc] init];
    _botaoDireita = [SKSpriteNode spriteNodeWithImageNamed:@"buttonMagic.png"];
    _botaoDireita.position = CGPointMake(900, 200);
    _botaoDireita.size = CGSizeMake(50, 50);
    _botaoDireita.name = @"botaoDireita";
    _botaoDireita.zPosition = +5.0;
    
    return _botaoDireita;
}

-(SKSpriteNode*)criaBotaoEsquerda{
    
    _botaoEsquerda = [[SKSpriteNode alloc] init];
    _botaoEsquerda = [SKSpriteNode spriteNodeWithImageNamed:@"buttonMagic.png"];
    _botaoEsquerda.position = CGPointMake(100, 200);
    _botaoEsquerda.size = CGSizeMake(50, 50);
    _botaoEsquerda.name = @"botaoEsquerda";
    _botaoEsquerda.zPosition = +5.0;
    
    return _botaoEsquerda;
}

/////////////////////////////////////////////////////// AÇÕES, ANIMAÇÕES E SPRITES ////////////////////////////////////////////////////////

//MOVIMENTO DIREITA ESQUERDA
-(void)acaoMoverDireita: (SKNode*)node{
    SKAction *moverPraDireita = [SKAction moveTo: CGPointMake(node.position.x+200, node.position.y) duration: 2];
    [node runAction: moverPraDireita];
}

-(void)acaoMoverEsquerda: (SKNode*)node{
    SKAction *moverPraEsquerda = [SKAction moveTo: CGPointMake(node.position.x-200, node.position.y) duration: 2];
    [node runAction: moverPraEsquerda];
}


//RECORTA SPRITES E ANIMA
-(NSMutableArray*)loadSpriteSheetFromImageWithName:(NSString*)name withNumberOfSprites:(int)numSprites withNumberOfRows:(int)numRows withNumberOfSpritesPerRow:(int)numSpritesPerRow {
    NSMutableArray* animationSheet = [NSMutableArray array];
    
    SKTexture *mainTexture = [SKTexture textureWithImageNamed:name];
    
    for(int j = numRows-1; j >= 0; j--) {
        for(int i = 0; i < numSpritesPerRow; i++) {
            
            SKTexture* part = [SKTexture textureWithRect:CGRectMake( i * (1.0f/numSpritesPerRow), j * (1.0f/numRows), 1.0f/numSpritesPerRow, 1.0f/numRows) inTexture: mainTexture];
            [animationSheet addObject: part];
            
            if(animationSheet.count == numSprites)
                break;
        }
        
        if(animationSheet.count == numSprites)
            break;
        
    }
    return animationSheet;
}

//////////////////////////////// GAME OVER ////////////////////////////////////////////
-(void)gameOver{
    [[GameOverViewController sharedManager]gameOverParaUmaCena].view.hidden = NO;
    [self pausaJogo];
}

-(void)pausaJogo{
    self.scene.view.paused = YES;
}



@end
