//
//  PegarNotasEPausasCena.m
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "PegarNotasEPausasCena.h"
#define GRAVIDADE_MUNDO -0.1

@implementation PegarNotasEPausasCena

-(id)initWithSize:(CGSize)size{
    
    if (self = [super initWithSize: size]){
        
    //Configura física do mundo
        self.gravidadeAtual = -0.05;
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, GRAVIDADE_MUNDO);
        
    //Inicia zerado auxiliar para pausa, contadores de tempo e pontuação
        self.simboloMusicalAtual = @"";
        self.densidadeAtual = 0.02f;
        
        self.estadoPauseJogo = 0;
        self.tempoPercorrido = 0;
        self.auxTempoPercorrido = 0;
        self.pontuacaoJogadorAtual = 0;
        self.indiceSimboloAtualSorteado = 5;
        
        self.quantidadeMovimentoEsquerda = 1;
        self.quantidadeMovimentoDireita = 1;
        
    //Inicia lista de notas e indice para sorteio
        self.listaDeSimbolosMusicais = [[NSMutableArray alloc] initWithObjects: @"notaSemibreve", @"notaMinima", @"notaSeminima", @"notaColcheia", @"notaSemicolcheia", @"notaFusa", @"notaSemifusa", @"pausa4Tempos", @"pausa2Tempos", @"pausa1Tempo", @"pausa1-2Tempo", @"pausa1-4Tempo", @"pausa1-8Tempo", @"pausa1-16Tempo", nil];
        
        self.listaNomeDosSimbolosMusicais = [[NSMutableArray alloc] initWithObjects: @"semibreve", @"miníma", @"seminíma", @"colcheia", @"semicolcheia", @"fusa", @"semifusa", @"pausa 4", @"pausa 2", @"pausa 1", @"pausa 1/2", @"pausa 1/4", @"pausa 1/8", @"pausa 1/16", nil];
        
        self.notasJaSorteadas = [[NSMutableArray alloc] init];
        
    //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
        
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bensound-goinghigher" ofType:@"mp3"]];
        [[EfeitoPlayer sharedManager]playAudio:musicFile:-1];

        
        
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
    self.labelDePontuacao.position = CGPointMake(950, 700);
    self.labelDePontuacao.zPosition = 2;
    self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
    self.labelDePontuacao.fontName = @"Marker Felt Thin";
    [self addChild: self.labelDePontuacao];
    
    self.stringDeSimboloMusical = [[SKLabelNode alloc]init];
    self.stringDeSimboloMusical.fontColor = [UIColor blackColor];
    self.stringDeSimboloMusical.fontSize = 50.0f;
    self.stringDeSimboloMusical.position = CGPointMake(710, 650);
    self.stringDeSimboloMusical.zPosition = 2;
    self.stringDeSimboloMusical.text = @"Símbolo: ";
    self.stringDeSimboloMusical.fontName = @"Marker Felt Thin";
    [self addChild: self.stringDeSimboloMusical];
    
    self.labelDeSimboloMusical = [[SKLabelNode alloc]init];
    self.labelDeSimboloMusical.fontColor = [UIColor blackColor];
    self.labelDeSimboloMusical.fontSize = 50.0f;
    self.labelDeSimboloMusical.position = CGPointMake(900, 650);
    self.labelDeSimboloMusical.zPosition = 2;
    self.labelDeSimboloMusical.text = self.simboloMusicalAtual;
    self.labelDeSimboloMusical.fontName = @"Marker Felt Thin";
    [self addChild: self.labelDeSimboloMusical];
}


/////////////////////////////////////////////////////// UPDATE DO TEMPO ////////////////////////////////////////////////
-(void)update:(CFTimeInterval)currentTime{
    
    if (self.estadoPauseJogo == 0) {
        self.auxTempoPercorrido+=1;
        
        //CADA 30ms do AUXILIAR = 1s NO TEMPO
        if ((self.auxTempoPercorrido == 40)) {
            
            //A cada 10 segundos cria novos simbolos
            if (self.tempoPercorrido % 20 == 0) {
                [self sortearSimboloAtual];
                [self sortearSimboloCerto];
                
                [self simboloPraCair1];
                [self simboloPraCair2];
                [self simboloPraCair3];
            }
            
            //A cada 1 min troca o simbolo pedido e aumenta densidade
            if (self.tempoPercorrido % 60 == 0) {
               // [self sortearSimboloAtual];
            }
            
            //A cada 2 min aumenta gravidade
            if (self.tempoPercorrido % 120 == 0) {
                self.physicsWorld.gravity = CGVectorMake(0, self.physicsWorld.gravity.dy+0.01);
            }
            
        self.tempoPercorrido++;
        self.auxTempoPercorrido = 0;
        }
        
    }
    
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
    
    NSLog(@"Simbolo Pedido %@", self.simboloMusicalAtual);
    NSLog(@"No de colisao %@", primeiroCorpoFisico.node.name);

    
    //VERIFICADOR DAS COLISÕES
    if ((primeiroCorpoFisico.categoryBitMask & simboloMusicalCorreto) != 0) {
        
        //COLISÃO MASCOTE
        if((segundoCorpoFisico.categoryBitMask & mascoteCategoria) != 0){
            
            
                //SIMBOLO CERTO
                if([primeiroCorpoFisico.node.name isEqual: [self simboloMusicalAtual]]){
                    NSLog(@"%@ colidiu com mascote - %fx | %fy", simbolo.name, simbolo.position.x, simbolo.position.y);
                    
                    //Remove o simbolo da view
                    [primeiroCorpoFisico.node removeFromParent];
                    
                    //Adiciona pontuação
                    self.pontuacaoJogadorAtual += 10;
                    self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
                    
                //SIMBOLO ERRADO
                }else{
                    NSLog(@"GAMEOVER %@ colidiu com mascote - %fx | %fy", simbolo.name, simbolo.position.x, simbolo.position.y);
                    [self gameOver];
                    
                }
        
        
        //COLISAO NO CHÃO
        }else{
            
            if((segundoCorpoFisico.categoryBitMask & pisoCategoria)!= 0){
            
                //NOTAS CERTAS
                if([primeiroCorpoFisico.node.name isEqual: [self simboloMusicalAtual]]){
                    NSLog(@"GAMEOVER %@ colidiu com chao - %fx | %fy", simbolo.name, simbolo.position.x, simbolo.position.y);
                    [self gameOver];
                    
                //NOTAS ERRADAS
                }else{
                    NSLog(@"%@ colidiu com chao", simbolo.name);
                    //Remove o simbolo da view
                    [primeiroCorpoFisico.node removeFromParent];
                    
                    //Adiciona pontuação
                    self.pontuacaoJogadorAtual += 10;
                    self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
                   
                }
            }
        }
        
        
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
            self.botaoDireita.alpha = 0;
            
            [self acaoMoverDireita: mascote];
            self.quantidadeMovimentoDireita++;
            
            if(self.quantidadeMovimentoEsquerda != 0)
                self.quantidadeMovimentoEsquerda--;
        }    }
    
//Botão esquerda
    if ([node.name isEqualToString:@"botaoEsquerda"]) {
        
        //Ate 2 movimentos
        if (self.quantidadeMovimentoEsquerda < 2) {
            self.botaoEsquerda.alpha = 0;
            
            [self acaoMoverEsquerda: mascote];
            self.quantidadeMovimentoEsquerda++;
            
            if(self.quantidadeMovimentoDireita != 0)
                self.quantidadeMovimentoDireita--;
        }
    }
    
    
}

/////////////////////////////////////////////////////// SORTEIOS ////////////////////////////////////////////////////////
-(void)sortearSimboloAtual{
    
    self.indiceSimboloAtualSorteado = arc4random() % 14;
    
    self.simboloMusicalAtual = [self.listaDeSimbolosMusicais objectAtIndex: self.indiceSimboloAtualSorteado];
    self.labelDeSimboloMusical.text = [self.listaNomeDosSimbolosMusicais objectAtIndex: self.indiceSimboloAtualSorteado];
    
}

-(NSString*)sortearSimboloPraCair{
    
    self.indiceParaSorteio = arc4random() % 14;
    return [self.listaDeSimbolosMusicais objectAtIndex: self.indiceParaSorteio];

}

-(void)sortearSimboloCerto{
    int auxiliar = 0;
    do {
        auxiliar = arc4random() % 3;
    } while (auxiliar == _indiceSortearCerto);
    
    _indiceSortearCerto = auxiliar;
}

/////////////////////////////////////////////////////// CRIAÇÃO ////////////////////////////////////////////////////////
//SIMBOLO 1
-(void)simboloPraCair1{
    
//Aloca, seta nome e tamanho do nó
    simbolo = [[SKNode alloc]init];
    
    if (_indiceSortearCerto == 0) {
        simbolo.name = self.simboloMusicalAtual;
    }else{
        simbolo.name = [self sortearSimboloPraCair];
    }
    
    
//Inicia
    self.simboloMusicalPraCair1 = [[SKSpriteNode alloc] init];
    self.simboloMusicalPraCair1.name = simbolo.name;

    if ([simbolo.name isEqualToString: @"notaSemibreve"] || [simbolo.name isEqualToString: @"pausa2Tempos"]|| [simbolo.name isEqualToString: @"pausa4Tempos"]) {
        self.simboloMusicalPraCair1.size = CGSizeMake(50, 25);
    }else{
        self.simboloMusicalPraCair1.size = CGSizeMake(50, 100);
    }
    simbolo.position = CGPointMake(312, 800);
    simbolo.zPosition = 5;
    
//Imagem
    SKTexture *textura = [SKTexture textureWithImageNamed: [NSString stringWithFormat:@"%@.png", simbolo.name]];
    self.simboloMusicalPraCair1.texture = textura;
    
//Cria o corpo físico
    simbolo.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.simboloMusicalPraCair1.size];
    simbolo.physicsBody.dynamic = YES;
    simbolo.physicsBody.affectedByGravity = YES;
    simbolo.physicsBody.density = self.densidadeAtual;
    simbolo.physicsBody.usesPreciseCollisionDetection = YES;
    simbolo.physicsBody.restitution = 0;
    simbolo.physicsBody.contactTestBitMask = pisoCategoria | mascoteCategoria;
    simbolo.physicsBody.categoryBitMask = simboloMusicalCorreto;
    
    NSLog(@"Simbolo 1 %@",simbolo.name);
    
    [simbolo addChild: self.simboloMusicalPraCair1];
    [self addChild: simbolo];

}

//SIMBOLO 2
-(void)simboloPraCair2{

    
//Aloca, seta nome e tamanho do nó
    simbolo = [[SKNode alloc]init];
    if (_indiceSortearCerto == 1) {
        simbolo.name = [self simboloMusicalAtual];
    }else{
        do {
            simbolo.name = [self sortearSimboloPraCair];
        } while ([simbolo.name isEqualToString: self.simboloMusicalPraCair1.name]);
    }
    
    
//Inicia
    self.simboloMusicalPraCair2 = [[SKSpriteNode alloc] init];
    self.simboloMusicalPraCair2.name = simbolo.name;
    
    if ([simbolo.name isEqualToString: @"notaSemibreve"] || [simbolo.name isEqualToString: @"pausa2Tempos"]|| [simbolo.name isEqualToString: @"pausa4Tempos"]) {
        self.simboloMusicalPraCair2.size = CGSizeMake(50, 25);
    }else{
        self.simboloMusicalPraCair2.size = CGSizeMake(50, 100);
    }
    
    simbolo.position = CGPointMake(512, 800);
    simbolo.zPosition = 5;

//Imagem
    SKTexture *textura = [SKTexture textureWithImageNamed: [NSString stringWithFormat:@"%@.png", simbolo.name]];
    self.simboloMusicalPraCair2.texture = textura;
    
//Cria o corpo físico
    simbolo.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.simboloMusicalPraCair2.size];
    simbolo.physicsBody.dynamic = YES;
    simbolo.physicsBody.affectedByGravity = YES;
    simbolo.physicsBody.density = self.densidadeAtual;
    simbolo.physicsBody.usesPreciseCollisionDetection = YES;
    simbolo.physicsBody.restitution = 0;
    simbolo.physicsBody.contactTestBitMask = pisoCategoria | mascoteCategoria;
    simbolo.physicsBody.categoryBitMask = simboloMusicalCorreto;
    
    NSLog(@"Simbolo 2 %@", simbolo.name);
    
    [simbolo addChild: self.simboloMusicalPraCair2];
    [self addChild: simbolo];
    
}

//SIMBOLO 3
-(void)simboloPraCair3{

    
//Aloca, seta nome e tamanho do nó
    simbolo = [[SKNode alloc]init];
    if (_indiceSortearCerto == 2) {
        simbolo.name = [self simboloMusicalAtual];
    }else{
        
        do {
            simbolo.name = [self sortearSimboloPraCair];
        } while ((([simbolo.name isEqualToString: self.simboloMusicalPraCair1.name]) || ([simbolo.name isEqualToString: self.simboloMusicalPraCair2.name])));
    }
    
    
//Incia
    self.simboloMusicalPraCair3 = [[SKSpriteNode alloc] init];
    self.simboloMusicalPraCair3.name = simbolo.name;

    if ([simbolo.name isEqualToString: @"notaSemibreve"] || [simbolo.name isEqualToString: @"pausa2Tempos"]|| [simbolo.name isEqualToString: @"pausa4Tempos"]) {
        self.simboloMusicalPraCair3.size = CGSizeMake(50, 25);
    }else{
        self.simboloMusicalPraCair3.size = CGSizeMake(50, 100);
    }
    simbolo.position = CGPointMake(712, 800);
    simbolo.zPosition = 5;
    
//Imagem
    SKTexture *textura = [SKTexture textureWithImageNamed: [NSString stringWithFormat:@"%@.png", simbolo.name]];
    self.simboloMusicalPraCair3.texture = textura;
    
//Cria o corpo físico
    simbolo.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.simboloMusicalPraCair3.size];
    simbolo.physicsBody.dynamic = YES;
    simbolo.physicsBody.affectedByGravity = YES;
    simbolo.physicsBody.density = self.densidadeAtual;
    simbolo.physicsBody.usesPreciseCollisionDetection = YES;
    simbolo.physicsBody.restitution = 0;
    simbolo.physicsBody.contactTestBitMask = pisoCategoria | mascoteCategoria;
    simbolo.physicsBody.categoryBitMask = simboloMusicalCorreto;
    
    NSLog(@"Simbolo 3 %@", simbolo.name);

    [simbolo addChild: self.simboloMusicalPraCair3];
    [self addChild: simbolo];
}


-(void)criaMascote{
    
//Incia
    mascote = [[SKNode alloc] init];
    mascote.position = CGPointMake(512, 100);
    mascote.zPosition = 5;
    mascote.name = @"mascote";

//Posicao e img
    _mascotePrincipal = [[SKSpriteNode alloc] init];
    SKTexture *textura = [SKTexture textureWithImageNamed: @"mascote.png"];
    _mascotePrincipal.texture = textura;
    _mascotePrincipal.size = CGSizeMake(100, 100);
    
//Cria o corpo físico do bloco
    mascote.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(100, 90)];
    mascote.physicsBody.dynamic = YES;
    mascote.physicsBody.affectedByGravity = NO;
    mascote.physicsBody.density = 0.2f;
    mascote.physicsBody.usesPreciseCollisionDetection = YES;
    mascote.physicsBody.restitution = 0;
    
//Colisao
    mascote.physicsBody.categoryBitMask = mascoteCategoria;
    mascote.physicsBody.contactTestBitMask = simboloMusicalCorreto;
    
//Adiciona a textura ao nó e o nó a cena
    [mascote addChild: _mascotePrincipal];
    [self addChild: mascote];
    
}

//FUNDO
-(void)criaFundo{
    
//Aloca, seta nome e posição do nó
    self.fundo = [[SKSpriteNode alloc] init];
    self.fundo.name = @"fundo";
    self.fundo.position  = CGPointMake(512, 384);
    
//Cria textura
    SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"fundoPapiro.png"];
    self.fundo.texture = texturaFundoPrincipal;
    self.fundo.size = CGSizeMake(1024, 768);
    self.fundo.zPosition = -5;
    
//Adiciona a textura ao nó e o nó a cena
    [self addChild: self.fundo];
}

//PISO
-(void)criaPiso{
    
//Aloca, seta nome e tamanho do nó
    piso = [[SKSpriteNode alloc]init];
    piso.name = @"piso";
    piso.position = CGPointMake(512, 10);
    
//Cria testura do piso
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed: @"chao.png"];
    self.pisoPrincipal = [SKSpriteNode spriteNodeWithTexture:texturaPiso size: CGSizeMake(2400, 50)];
    self.pisoPrincipal.alpha = 0;
    
//Cria o corpo físico do piso
    piso.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.pisoPrincipal.size];
    piso.physicsBody.dynamic = NO;
    piso.physicsBody.affectedByGravity = NO;
    piso.physicsBody.allowsRotation = NO;
    piso.physicsBody.density = 0.6f;
    piso.physicsBody.restitution = 0;
    
//Configuração colisão do corpo físico do piso
    piso.physicsBody.categoryBitMask = pisoCategoria;
    piso.physicsBody.contactTestBitMask = simboloMusicalCorreto;
    
//Adiciona a textura ao nó, e o nó a cena
    [piso addChild: self.pisoPrincipal];
    [self addChild: piso];
}

-(SKSpriteNode*)criaBotaoDireita{
    
    _botaoDireita = [[SKSpriteNode alloc] init];
    _botaoDireita = [SKSpriteNode spriteNodeWithImageNamed:@"botaoDireita.png"];
    
    _botaoDireita.position = CGPointMake(924, 100);
    _botaoDireita.size = CGSizeMake(200, 200);
    _botaoDireita.name = @"botaoDireita";
    _botaoDireita.zPosition = +5.0;
    
    return _botaoDireita;
}

-(SKSpriteNode*)criaBotaoEsquerda{
    
    _botaoEsquerda = [[SKSpriteNode alloc] init];
    _botaoEsquerda = [SKSpriteNode spriteNodeWithImageNamed:@"botaoEsquerda.png"];
    
    _botaoEsquerda.position = CGPointMake(100, 100);
    _botaoEsquerda.size = CGSizeMake(200, 200);
    _botaoEsquerda.name = @"botaoEsquerda";
    _botaoEsquerda.zPosition = +5.0;
    
    return _botaoEsquerda;
}

/////////////////////////////////////////////////////// AÇÕES, ANIMAÇÕES E SPRITES ////////////////////////////////////////////////////////

//MOVIMENTO DIREITA ESQUERDA
-(void)acaoMoverDireita: (SKNode*)node{
    SKAction *moverPraDireita = [SKAction moveTo: CGPointMake(node.position.x+200, node.position.y) duration: 1.5];
    [node runAction: moverPraDireita];
    
    self.botaoDireita.alpha = 1;

}

-(void)acaoMoverEsquerda: (SKNode*)node{
    SKAction *moverPraEsquerda = [SKAction moveTo: CGPointMake(node.position.x-200, node.position.y) duration: 1.5];
    [node runAction: moverPraEsquerda];
    
    self.botaoEsquerda.alpha = 1;
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
    [[EfeitoPlayer sharedManager]stopAudio];

}

-(void)pausaJogo{
    self.scene.view.paused = YES;
}

@end
