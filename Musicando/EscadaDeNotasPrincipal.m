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
        
//        //Inicia zerado auxiliar para pausa, contadores de tempo e pontuação
//        self.estadoPauseJogo = 0;
//        self.tempoPercorrido = 0;
//        self.auxTempoPercorrido = 0;
//        self.pontuacaoJogadorAtual = 0;
//        
//        //Inicia com velocidade padrão do guindaste
//        self.velocidadeGuindaste = 10;
//        
        //Inicia lista de notas e indice para sorteio
        self.listaDeNotas = [[NSArray alloc] initWithObjects: @"Dó", @"Ré", @"Mi", @"Fá", @"Sol", @"Lá", @"Si", nil];
        self.indiceNotaSorteada = 0;
        
        //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
        activeDragNode = nil;
    }
    
    return self;
}


-(void)carregarPrimeirosComponentes{
    
    [self criaFundo];
//    [self criaPiso];
//    
//    //[self criaGuindaste];
//    [self criaTocaTreco];
    [self criaPentagrama];
    [self criaNotaMusical];
    
//    [self addChild: [self criarBotaoCairBloco]];
//    
//    
//    //Configura as labels de pontuação
//    self.stringDePontuacao = [[SKLabelNode alloc]init];
//    self.stringDePontuacao.color = [UIColor blackColor];
//    self.stringDePontuacao.fontSize = 25.0f;
//    self.stringDePontuacao.position = CGPointMake(80, 500);
//    self.stringDePontuacao.zPosition = 2;
//    self.stringDePontuacao.text = @"Pontuação: ";
//    self.stringDePontuacao.fontName = @"Marker Felt Thin";
//    [self addChild: self.stringDePontuacao];
//    
//    self.labelDePontuacao = [[SKLabelNode alloc]init];
//    self.labelDePontuacao.color = [UIColor blackColor];
//    self.labelDePontuacao.fontSize = 25.0f;
//    self.labelDePontuacao.position = CGPointMake(160, 500);
//    self.labelDePontuacao.zPosition = 2;
//    self.labelDePontuacao.text = @"0";
//    self.labelDePontuacao.fontName = @"Marker Felt Thin";
//    [self addChild: self.labelDePontuacao];
    
}




/////////////////////////////////////////////////////// UPDATE DO TEMPO ////////////////////////////////////////////////////////

-(void)update:(CFTimeInterval)currentTime{
    //Condicao para calcular distancia percorrida
    
//    if(self.estadoPauseJogo == 0 ){
    
        //        if(self.tempoPassaroBonus == 0){
        //            self.verfificaBotaoFly = false;
        //            buttonDownNode.hidden = NO;
        //            buttonUpNode.hidden = NO;
        //            buttonMagic.hidden = YES;
        //            [self heroRun];
        //            self.man.physicsBody.density = 0.2f;
        //            [self.man.physicsBody applyForce:CGVectorMake(0, 50)];
        //            self.tempoPassaroBonus +=1;
        //        }
        //
        //        if(self.verfificaBotaoFly == true){
        //            if (self.tempoPassaraoAux % 40 == 0) {
        //                if(self.tempoPassaroBonus >0){
        //                    self.tempoPassaroBonus -=1;
        //                    self.tempoPassaraoAux = 0;
        //                }
        //            }
        //        }
        
        //        if(self.tempoPassaroBonus >= 10){
        //            buttonMagic.hidden = NO;
        //        }
        
//        self.auxTempoPercorrido += 1;
//        //self.tempoPassaraoAux +=1;
//        
//        
//        //CHAMA VARIACOES COM A VELOCIDADE ACIMA DE 40M
//        if(self.auxTempoPercorrido > 40){
//            
//            self.tempoPercorrido += 1;
//            self.auxTempoPercorrido = 0;
    
            //self.textoDistancia.text = [NSString stringWithFormat:@"%d", self.tempoPercorrido];
            //self.tempoFly.text = [NSString stringWithFormat:@"%d", self.tempoPassaroBonus];
            //self.numMagia.text = [NSString stringWithFormat:@"%d", self.qtdPower];
            
//            //Controla a velocidade dos monstros
//            if(self.tempoPercorrido % 30 == 0){
//                if(self.velocidadeGuindaste > 1){
//                    self.velocidadeGuindaste -= 0.10;
//                }
//            }
    
            //AUMENTA PODER
            //            if(self.tempoPercorrido % 30 == 0){
            //                self.qtdPower = self.qtdPower + 1;
            //            }
            //
            //            //CRIA MURO E segura o pulo maior por 3 segundos
            //            if(self.tempoPercorrido %50 == 0){
            //                self.nivelMosntro = true;
            //                [self criaMuro];
            //                [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(tiraMuroMonstroNivel1e2) userInfo:nil repeats:NO];
            //
            //            }
            
            //CRIA BURACO
            //            if(self.tempoPercorrido %13 == 0){
            //                [self criaBuraco];
            //            }
            
            //            //AUMENTA BONUS PASSARO
            //            if(self.tempoPercorrido %35 == 0){
            //                self.tempoPassaroBonus += 10;
            //            }
            
            //SE BATE RECORDE CHAMA ANIMACAO ESPECIAL
            //            if(self.verificaBateRecorde != true){
            //                [self configurarRanking];
            //                //Aparece Toasty
            //                if (self.pontuacaoJogadorAtual > self.pontuacaoJogadorNoRanking){
            //                    [self apareceToasty];
            //                    self.verificaBateRecorde = true;
            //                }
            //            }
            
            //CHAMA OS MONSTROS ALEATORIAMENTE
            //            if(self.tempoPercorrido % 7 == 0){
            //                self.sorteaMonstro = arc4random()%2;
            //
            //                if(self.nivelMosntro == false) {
            //                    switch (self.sorteaMonstro) {
            //                        case 0:
            //                            [self criaMorte];
            //                            break;
            //
            //                        case 1:
            //                            [self criaDragao];
            //                            break;
            //                    }
            //                }else{
            //                    switch (self.sorteaMonstro) {
            //                        case 0:
            //                            [self criaMaicon];
            //                            break;
            //
            //                        case 1:
            //                            [self criaGargula];
            //                            break;
            //                    }
            //                }
//        }
//        
//    }
//    
    
    
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
    
    
    //VERIFICADOR DAS COLISÕES
    if ((primeiroCorpoFisico.categoryBitMask & nota) != 0) {
        
        //Verifica se o bloco colidiu com tocaTreco
        if((segundoCorpoFisico.categoryBitMask & linha) != 0){
            
            //NOTAS CERTAS
            if([self.notaMusicalPrincipal.name isEqualToString:@"Dó"]){
                
                NSLog(@"Colidiu nota na linha");
//
//                //Remove os blocos da view
//                [blocoNota removeAllChildren];
//                [blocoNota removeFromParent];
//                
//                //Adiciona pontuação
//                self.pontuacaoJogadorAtual += 10;
//                self.labelDePontuacao.text = [NSString stringWithFormat: @"%i", self.pontuacaoJogadorAtual];
//                
//                //Aguarda alguns segundos até criar um novo
//                [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(criaBlocoNotaMusical) userInfo:nil repeats:NO];
//                [[self botaoCairNota] setAlpha: 1];
                
                //NOTAS ERRADAS
            }else if([self.notaMusicalPrincipal.name isEqualToString:@"Dó"]){
                
//                NSLog(@"Colidiu nota errada com tocatreco - %@", blocoNota.name);

            }
            //COLISAO NO CHÃO
        }else{
            
            if((segundoCorpoFisico.categoryBitMask & espaco) != 0){
                
                //NOTAS CERTAS
                }if([self.notaMusicalPrincipal.name isEqualToString:@"Dó"]){
                
                    NSLog(@"Colidiu nota no espaço");
                
                
                //NOTAS ERRADAS
                }else if([self.notaMusicalPrincipal.name isEqualToString:@"Dó"]){
                
//                    NSLog(@"Colidiu com o chão nota errada - %@", blocoNota.name);
            
                }
        }
        
        
    }
    
    
}


/////////////////////////////////////////////////////// CAPTA TOQUE ////////////////////////////////////////////////////////
//CHAMADO QUANDO HÁ UM TOQUE NA TELA


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    // Identify where this touch is on the scene
    CGPoint scenePosition = [touch locationInNode: self];
    // Find the child node that contains this touch
    SKNode* checkNode = [self nodeAtPoint:scenePosition];
    // Make sure it is a player ship and not another node like the parent SKScene
    if (checkNode && [checkNode.name isEqual:@"Dó"]) {
        activeDragNode = (SKSpriteNode*)checkNode;
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
    
    //Antigos: 212 - 812
    SKAction *moverPraEsquerda = [SKAction moveTo: CGPointMake(312, node.position.y) duration: duracao];
    SKAction *moverPraDireita = [SKAction moveTo: CGPointMake(912, node.position.y) duration: duracao];
    SKAction *movimentoCompleto = [SKAction sequence: @[moverPraEsquerda, moverPraDireita]];
    
    [node runAction:[SKAction repeatActionForever: movimentoCompleto]];
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
    //SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"backPapel.png"];
    self.fundoPrincipal = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size: CGSizeMake(1024, 768)];
    fundo.zPosition = -5;
    
    //Adiciona a textura ao nó e o nó a cena
    [fundo addChild: self.fundoPrincipal];
    [self addChild: fundo];
}


//NOTA MUSICAL
-(void)criaNotaMusical{
    
    //Aloca, seta nome e posição do nó
    notaMusical = [[SKNode alloc]init];
    notaMusical.name = @"Nota";
    notaMusical.position = CGPointMake(512, 700);
    notaMusical.zPosition = 2;
    
    //Cria textura
    SKTexture *texturaNota = [SKTexture textureWithImageNamed: @"faBloco.png"];
    self.notaMusicalPrincipal = [SKSpriteNode spriteNodeWithTexture: texturaNota size: CGSizeMake(50, 50)];
    self.notaMusicalPrincipal.name = @"Dó";
    
    
    //Cria o corpo físico do bloco
    self.notaMusicalPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(120, 122)];
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
}


//NOTA MUSICAL
-(void)criaPentagrama{
    
    //Aloca, seta nome e posição do nó
    pentagrama = [[SKNode alloc]init];
    pentagrama.name = @"Pentagrama";
    pentagrama.position = CGPointMake(512, 100);
    pentagrama.zPosition = 0;
    
    //Adiciona as linhas ao pentagrama
    self.linhaDoPentagrama1 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(800, 10)];
    self.linhaDoPentagrama2 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(800, 10)];
    self.linhaDoPentagrama3 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(800, 10)];
    self.linhaDoPentagrama4 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(800, 10)];
    self.linhaDoPentagrama5 = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size: CGSizeMake(800, 10)];
    
    self.espacoDoPentagrama1 = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size: CGSizeMake(800, 40)];
    self.espacoDoPentagrama2 = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size: CGSizeMake(800, 40)];
    self.espacoDoPentagrama3 = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size: CGSizeMake(800, 40)];
    self.espacoDoPentagrama4 = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size: CGSizeMake(800, 40)];
    
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




@end
