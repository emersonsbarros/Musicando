//
//  EscadaDeNotasPrincipal.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EscadaDeNotasPrincipal.h"
#define GRAVIDADE_MUNDO -10

@implementation EscadaDeNotasPrincipal

-(id)initWithSize:(CGSize)size{
    if (self = [super initWithSize:size]) {
        
        //Configura física do mundo
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, GRAVIDADE_MUNDO);
        
        //Inicia zerado auxiliar para pausa, contadores de tempo e pontuação
        self.estadoPauseJogo = 0;
        self.tempoEncerrado = NO;
        self.escalaCerta = NO;
        
        self.tempoPercorrido = 0;
        self.auxTempoPercorrido = 0;
        self.pontuacaoJogadorAtual = 0;
        
        //Inicia lista de notas e indice para sorteio
        self.listaDeNotasComPosicoes = [[NSMutableArray alloc] init];
        self.listaDeNotas = [[NSArray alloc] initWithObjects: @"Do", @"Re", @"Mi", @"Fa", @"Sol", @"La", @"Si", nil];
        self.indiceNotaSorteada = 0;
        [self sortearQuantidadeDeNotas];
        
        //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
        
        
        activeDragNode = nil;
    }
    
    return self;
}

-(void)gameOver{
    [[GameOverViewController sharedManager]gameOverParaUmaCena].view.hidden = NO;
    [self pausaJogo];
}

-(void)pausaJogo{
    self.scene.view.paused = YES;
}


-(void)carregarPrimeirosComponentes{
    
    [self criaFundo];
    [self criaNotasMusicais];
    [self criaPentagrama];
    [self criaBotaoStarAndCheck];
    
    
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
    
    self.stringDeTempo = [[SKLabelNode alloc]init];
    self.stringDeTempo.fontColor = [UIColor blackColor];
    self.stringDeTempo.fontSize = 50.0f;
    self.stringDeTempo.position = CGPointMake(840, 650);
    self.stringDeTempo.zPosition = 2;
    self.stringDeTempo.text = @"Tempo:";
    self.stringDeTempo.fontName = @"Marker Felt Thin";
    [self addChild: self.stringDeTempo];
    
    self.labelDeTempo = [[SKLabelNode alloc]init];
    self.labelDeTempo.fontColor = [UIColor blackColor];
    self.labelDeTempo.fontSize = 50.0f;
    self.labelDeTempo.position = CGPointMake(940, 650);
    self.labelDeTempo.zPosition = 2;
    self.labelDeTempo.text = [NSString stringWithFormat: @"%d", self.tempoPercorrido];
    self.labelDeTempo.fontName = @"Marker Felt Thin";
    [self addChild: self.labelDeTempo];
    
}




/////////////////////////////////////////////////////// UPDATE DO TEMPO ////////////////////////////////////////////////////////

-(void)update:(CFTimeInterval)currentTime{
    
    if (self.estadoPauseJogo == 0) {
        self.auxTempoPercorrido+=1;

        if (self.auxTempoPercorrido == 30) {
            
            if ([self.botaoStartAndChek.name isEqualToString: @"check"]) {
                if (self.tempoPercorrido > 0) {
                    
                    self.tempoPercorrido -=1;
                    self.labelDeTempo.text = [NSString stringWithFormat: @"%d", self.tempoPercorrido];
                    self.auxTempoPercorrido = 0;
                    if(self.tempoPercorrido == 0) self.tempoEncerrado = YES;
                    
                }
            }
            
            self.auxTempoPercorrido = 0;

        }
    }
    
}



/////////////////////////////////////////////////////// CAPTA COLISÃO ////////////////////////////////////////////////////////
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


/////////////////////////////////////////////////////// CAPTA TOQUE ////////////////////////////////////////////////////////
//CHAMADO QUANDO HÁ UM TOQUE NA TELA


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode: self];
    SKNode* checkNode = [self nodeAtPoint: scenePosition];
    
//ATIVA MOVIMENTO NO NÓ DE NOTA
    if (checkNode && ([checkNode.name isEqual:@"Do"] || [checkNode.name isEqual:@"Re"] || [checkNode.name isEqual:@"Mi"] || [checkNode.name isEqual:@"Fa"] || [checkNode.name isEqual:@"Sol"] || [checkNode.name isEqual:@"La"] || [checkNode.name isEqual:@"Si"])) {
        activeDragNode = (SKSpriteNode*)checkNode;
    }
    
//START
    if ([checkNode.name isEqualToString: @"start"]) {
        self.tempoPercorrido = 20;
        checkNode.name = @"check";
    }
    
//CHECK
    if ([checkNode.name isEqualToString: @"check"] && _tempoEncerrado) {
        
        
        for (SKSpriteNode *nota in self.listaDeNotasComPosicoes) {
            
            NSLog(@"%@", nota.name);
            
            //1a LINHA SUPLEMENTAR
            if ([nota.name isEqualToString: @"Do"]) {
                NSLog(@"%f", nota.position.y);
                if (nota.position.y >= 235 && nota.position.y <= 255) {
                    NSLog(@"DÓ CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;

                }else{
                    NSLog(@"DÓ ERRADO");
                    _escalaCerta = NO;
                    break;
                }
            }
            
            //1o ESPACO SUPLEMENTAR
            if ([nota.name isEqualToString: @"Re"]) {
                if (nota.position.y >= 260 && nota.position.y <= 280) {
                    NSLog(@"RÉ CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;

                }else{
                    NSLog(@"RÉ ERRADO");
                    _escalaCerta = NO;
                    break;

                }
            }
            
            //1a LINHA
            if ([nota.name isEqualToString: @"Mi"]) {
                NSLog(@"%f", nota.position.y);
                if (nota.position.y >= 285 && nota.position.y <= 105) {
                    NSLog(@"MI CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;


                }else{
                    NSLog(@"MI ERRADO");
                    _escalaCerta = NO;
                    break;
                }
            }
            
            //1o ESPACO
            if ([nota.name isEqualToString: @"Fa"]) {
                NSLog(@"%f", nota.position.y);
                if (nota.position.y >= 310 && nota.position.y <= 330) {
                    NSLog(@"FÁ CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;

                }else{
                    NSLog(@"FÁ ERRADO");
                    _escalaCerta = NO;
                    break;

                }
            }
            
            //2a LINHA
            if ([nota.name isEqualToString: @"Sol"]) {
                NSLog(@"%f", nota.position.y);
                if (nota.position.y >= 340 && nota.position.y <= 360) {
                    NSLog(@"SOL CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;

                }else{
                    NSLog(@"SOL ERRADO");
                    _escalaCerta = NO;
                    break;

                }
            }
            
            //2o ESPACO
            if ([nota.name isEqualToString: @"La"]) {
                NSLog(@"%f", nota.position.y);

                if (nota.position.y >= 360 && nota.position.y <= 380) {
                    NSLog(@"LÁ CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;

                }else{
                    NSLog(@"LÁ ERRADO");
                    _escalaCerta = NO;
                    break;

                }
            }
            
            //3a LINHA
            if ([nota.name isEqualToString: @"Si"]) {
                NSLog(@"%f", nota.position.y);

                if (nota.position.y >= 390 && nota.position.y <= 410) {
                    NSLog(@"SI CERTO");
                    self.pontuacaoJogadorAtual += 10;
                    _escalaCerta = YES;
                }else{
                    NSLog(@"SI ERRADO");
                    _escalaCerta = NO;
                    break;
                }
            }
            
        }
        
        self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
        
        if (!self.escalaCerta){
            NSLog(@"Chama cena de GameOver!");
            [self gameOver];
        }else{
            NSLog(@"ESCALA CERTA");
            self.botaoStartAndChek.name = @"start";
            self.tempoEncerrado = NO;
            self.tempoPercorrido = 0;
            
            for(SKSpriteNode *nota in self.listaDeNotasComPosicoes){
                [nota removeFromParent];
            }
            
            [self criaNotasMusicais];
            
        }

    }
    
    
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Be sure we have a reference to an object to drag
    if (activeDragNode == nil)
        return;
    
    UITouch *touch = [touches anyObject];
    CGPoint scenePosition = [touch locationInNode:self];
    CGPoint lastPosition = [touch previousLocationInNode:self];
    
    // Calculate the new location of the dragged node
    CGPoint newLoc = CGPointMake(activeDragNode.position.x + (scenePosition.x - lastPosition.x), activeDragNode.position.y + (scenePosition.y - lastPosition.y));
    // Update this location
    activeDragNode.position = newLoc;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // Remove reference to which object we are dragging
    activeDragNode = nil;
}

//////////////////////////// Metodos Add Gesture  /////////////////////////////




/////////////////////////////////////////////////////// AÇÕES, ANIMAÇÕES E SPRITES ////////////////////////////////////////////////////////

//MOVIMENTO DIREITA ESQUERDA
-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao{
    
    SKAction *moverPraEsquerda = [SKAction moveTo: CGPointMake(312, node.position.y) duration: duracao];
    SKAction *moverPraDireita = [SKAction moveTo: CGPointMake(912, node.position.y) duration: duracao];
    SKAction *movimentoCompleto = [SKAction sequence: @[moverPraEsquerda, moverPraDireita]];
    
    [node runAction: [SKAction repeatActionForever: movimentoCompleto]];
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


/////////////////////////////////////////////////////// CRIAÇÃO DE NODES ////////////////////////////////////////////////////////


//FUNDO
-(void)criaFundo{
    
    //Aloca, seta nome e posição do nó
    fundo = [[SKNode alloc]init];
    fundo.name = @"Fundo";
    fundo.position  = CGPointMake(512, 384);
    
    //Cria textura
    SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"papelAntigo.jpg"];
    self.fundoPrincipal = [SKSpriteNode spriteNodeWithTexture:texturaFundoPrincipal size: CGSizeMake(1024, 768)];
    fundo.zPosition = -5;
    
    //Adiciona a textura ao nó e o nó a cena
    [fundo addChild: self.fundoPrincipal];
    [self addChild: fundo];
}

-(void)sortearQuantidadeDeNotas{
    self.quantidadeDeNotas = arc4random() % 4 + 1;
}

//NOTA MUSICAL
-(void)criaNotasMusicais{
    
    int auxiliarPosicaoX = 200;

    for (int i = 0; i < self.quantidadeDeNotas; i++) {
        
        notaMusical = [[SKNode alloc] init];
        notaMusical.zPosition = 2;
        
        //Seta nome sorteado
        self.indiceNotaSorteada = arc4random() % 7;
        
        _notaMusicalPrincipal = [[SKSpriteNode alloc] init];
        _notaMusicalPrincipal.position = CGPointMake(auxiliarPosicaoX, 700);
        _notaMusicalPrincipal.name = [self.listaDeNotas objectAtIndex: self.indiceNotaSorteada];
        SKTexture *texturaNota = [SKTexture textureWithImageNamed: [NSString stringWithFormat: @"%@.png", _notaMusicalPrincipal.name]];

        _notaMusicalPrincipal.texture = texturaNota;
        _notaMusicalPrincipal.size = CGSizeMake(40, 40);
        
        //Cria o corpo físico do bloco
        self.notaMusicalPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(40, 40)];
        self.notaMusicalPrincipal.physicsBody.dynamic = YES;
        self.notaMusicalPrincipal.physicsBody.affectedByGravity = NO;
        self.notaMusicalPrincipal.physicsBody.density = 0.2f;
        self.notaMusicalPrincipal.physicsBody.usesPreciseCollisionDetection = YES;
        self.notaMusicalPrincipal.physicsBody.restitution = 0;
        
        self.notaMusicalPrincipal.physicsBody.categoryBitMask = nota;
        self.notaMusicalPrincipal.physicsBody.collisionBitMask = ~espaco | ~linha;
        self.notaMusicalPrincipal.physicsBody.contactTestBitMask = piso | linha | espaco;
        
        //Adiciona a textura ao nó e o nó a cena
        [notaMusical addChild: self.notaMusicalPrincipal];
        [self addChild: notaMusical];
        
        [_listaDeNotasComPosicoes addObject: self.notaMusicalPrincipal];
        
        auxiliarPosicaoX+=20;
    }
    
}


//NOTA MUSICAL
-(void)criaPentagrama{
    
    //Aloca, seta nome e posição do nó
    pentagrama = [[SKNode alloc]init];
    pentagrama.name = @"Pentagrama";
    pentagrama.position = CGPointMake(512, 100);
    pentagrama.zPosition = 0;
    
    //Adiciona as linhas ao pentagrama
    self.linhaDoPentagrama1 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(1200, 10)];
    self.linhaDoPentagrama2 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(1200, 10)];
    self.linhaDoPentagrama3 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(1200, 10)];
    self.linhaDoPentagrama4 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(1200, 10)];
    self.linhaDoPentagrama5 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(1200, 10)];
    
    self.espacoDoPentagrama1 = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size: CGSizeMake(1200, 40)];
    self.espacoDoPentagrama2 = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size: CGSizeMake(1200, 40)];
    self.espacoDoPentagrama3 = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size: CGSizeMake(1200, 40)];
    self.espacoDoPentagrama4 = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size: CGSizeMake(1200, 40)];
    
    [pentagrama addChild: self.linhaDoPentagrama1];
    [pentagrama addChild: self.linhaDoPentagrama2];
    [pentagrama addChild: self.linhaDoPentagrama3];
    [pentagrama addChild: self.linhaDoPentagrama4];
    [pentagrama addChild: self.linhaDoPentagrama5];
    
    int auxiliarPosicaoYDaLinha = 300;
    
    //Linhas do pentagrama
    for (SKSpriteNode *linhaDePentagrama in pentagrama.children) {

        linhaDePentagrama.position = CGPointMake(500, auxiliarPosicaoYDaLinha);
        linhaDePentagrama.zPosition = 0;

        //linhaDePentagrama.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(800, 10)];
        linhaDePentagrama.physicsBody.dynamic = YES;
        linhaDePentagrama.physicsBody.affectedByGravity = NO;
        linhaDePentagrama.physicsBody.density = 0.2f;
        linhaDePentagrama.physicsBody.usesPreciseCollisionDetection = YES;
        linhaDePentagrama.physicsBody.restitution = 0;
        
        linhaDePentagrama.physicsBody.categoryBitMask = linha;
        linhaDePentagrama.physicsBody.collisionBitMask = ~nota;
        linhaDePentagrama.physicsBody.contactTestBitMask = nota;
        
        auxiliarPosicaoYDaLinha+=50;
    }
    
    [pentagrama removeAllChildren];
    
    [pentagrama addChild: self.espacoDoPentagrama1];
    [pentagrama addChild: self.espacoDoPentagrama2];
    [pentagrama addChild: self.espacoDoPentagrama3];
    [pentagrama addChild: self.espacoDoPentagrama4];
    
    auxiliarPosicaoYDaLinha = 325;
    
    //Espaços do pentagrama
    for (SKSpriteNode *espacoDePentagrama in pentagrama.children) {
        
        espacoDePentagrama.position = CGPointMake(500, auxiliarPosicaoYDaLinha);
        espacoDePentagrama.zPosition = 0;
        
        //espacoDePentagrama.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(800, 40)];
        espacoDePentagrama.physicsBody.dynamic = YES;
        espacoDePentagrama.physicsBody.affectedByGravity = NO;
        espacoDePentagrama.physicsBody.density = 0.2f;
        espacoDePentagrama.physicsBody.usesPreciseCollisionDetection = YES;
        espacoDePentagrama.physicsBody.restitution = 0;
        
        espacoDePentagrama.physicsBody.categoryBitMask = espaco;
        espacoDePentagrama.physicsBody.collisionBitMask = ~nota;
        espacoDePentagrama.physicsBody.contactTestBitMask = nota;
        
        auxiliarPosicaoYDaLinha+=50;
    }
    
    [pentagrama removeAllChildren];

    [self addChild: self.linhaDoPentagrama1];
    [self addChild: self.linhaDoPentagrama2];
    [self addChild: self.linhaDoPentagrama3];
    [self addChild: self.linhaDoPentagrama4];
    [self addChild: self.linhaDoPentagrama5];
    [self addChild: self.espacoDoPentagrama1];
    [self addChild: self.espacoDoPentagrama2];
    [self addChild: self.espacoDoPentagrama3];
    [self addChild: self.espacoDoPentagrama4];
    //[self addChild: pentagrama];
}

- (void)criaBotaoStarAndCheck{
    
    _botaoStartAndChek = [SKSpriteNode spriteNodeWithImageNamed:@"buttonMagic.png"];
    _botaoStartAndChek.position = CGPointMake(900, 200);
    _botaoStartAndChek.size = CGSizeMake(50, 50);
    _botaoStartAndChek.name = @"start";
    _botaoStartAndChek.zPosition = +5.0;
    
    [self addChild: _botaoStartAndChek];
}



@end
