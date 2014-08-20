//
//  GameBlocosPrincipal.m
//  Musicando
//
//  Created by Emerson Barros on 11/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "GameBlocosPrincipal.h"
#define GRAVIDADE_MUNDO -10

@implementation GameBlocosPrincipal


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        //Configura física do mundo
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0, GRAVIDADE_MUNDO);
        
        //Inicia zerado auxiliar para pausa, contadores de tempo e pontuação
        self.estadoPauseJogo = 0;
        self.tempoPercorrido = 0;
        self.auxTempoPercorrido = 0;
        self.pontuacaoJogadorAtual = 0;
        self.podeCair = YES;
        
        //Inicia com velocidade padrão do guindaste
        self.velocidadeGuindaste = 1;
        
        //Inicia lista de notas e indice para sorteio
        self.listaDeNotas = [[NSArray alloc] initWithObjects: @"Dó", @"Ré", @"Mi", @"Fá", @"Sol", @"Lá", @"Si", @"Dor", @"Rir", @"Mou", @"Fê", @"Sou", @"Lú", @"Sir", nil];

        //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
        [self sortearNota];
        
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"bensound-badass" ofType:@"mp3"]];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
        self.audioPlayer.numberOfLoops = -1;
        [self.audioPlayer play];
    }
    
    return self;
}

-(void)gameOver{
    [[GameOverViewController sharedManager]gameOverParaUmaCena].view.hidden = NO;
    [self pausaJogo];
    [self.audioPlayer stop];
}

-(void)pausaJogo{
    self.scene.view.paused = YES;
}

-(void)carregarPrimeirosComponentes{
    
//    //[self criaFundo];
    [self criaPiso];

    [self cairNota];
    [self criaTocaTreco];
    [self criaBlocoNotaMusical];

//Configura as labels de pontuação
    self.stringDePontuacao = [[SKLabelNode alloc]init];
    self.stringDePontuacao.fontColor = [UIColor blackColor];
    self.stringDePontuacao.fontSize = 40.0f;
    self.stringDePontuacao.position = CGPointMake(120, 670);
    self.stringDePontuacao.zPosition = 2;
    self.stringDePontuacao.text = @"Pontuação: ";
    self.stringDePontuacao.fontName = @"Marker Felt Thin";
    [self addChild: self.stringDePontuacao];

    self.labelDePontuacao = [[SKLabelNode alloc]init];
    self.labelDePontuacao.fontColor = [UIColor blackColor];
    self.labelDePontuacao.fontSize = 40.0f;
    self.labelDePontuacao.position = CGPointMake(250, 670);
    self.labelDePontuacao.zPosition = 2;
    self.labelDePontuacao.text = @"0";
    self.labelDePontuacao.fontName = @"Marker Felt Thin";
    [self addChild: self.labelDePontuacao];
    
//Adiciona a nota e sua label o nome sorteado
    self.nomeDaNota = [[SKLabelNode alloc]init];
    self.nomeDaNota.fontColor = [UIColor blackColor];
    self.nomeDaNota.fontSize = 40.0f;
    self.nomeDaNota.position = CGPointMake(100, 720);
    self.nomeDaNota.zPosition = 2;
    self.nomeDaNota.fontName = @"Marker Felt Thin";
    
    //Adiciona a nota e sua label o nome sorteado
    self.nomeDaNota.text = [NSString stringWithFormat:@"Nota: %@", [self.listaDeNotas objectAtIndex: self.indiceNotaSorteada]];
    [self addChild: self.nomeDaNota];
}





/////////////////////////////////////////////////////// UPDATE DO TEMPO ////////////////////////////////////////////////////////

-(void)update:(CFTimeInterval)currentTime{
    //Condicao para calcular distancia percorrida
    
    if(self.estadoPauseJogo == 0 ){
        
        self.auxTempoPercorrido += 1;
        
        //CHAMA VARIACOES COM A VELOCIDADE ACIMA DE 40M
        if(self.auxTempoPercorrido > 40){
            
            self.tempoPercorrido += 1;
            self.auxTempoPercorrido = 0;
            
            //Controla a velocidade do bloco
            if(self.tempoPercorrido % 30 == 0){
                if(self.velocidadeGuindaste > 1)
                    self.velocidadeGuindaste -= 0.10;
            }
            
        }
        
    }
        
}



/////////////////////////////////////////////////////// COLISÃO ////////////////////////////////////////////////////////
-(void)didBeginContact:(SKPhysicsContact *)contact {
    
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
    if ((primeiroCorpoFisico.categoryBitMask & blocoNotaCorreta) != 0) {
        
//COLISÃO TOCATRECO
        if((segundoCorpoFisico.categoryBitMask & tocaTrecoCategoria) != 0){
            
            NSLog(@"Pos %fx - %fy", blocoNota.position.x, blocoNota.position.y);
            if (((blocoNota.position.y <= 600) && (blocoNota.position.x >= 300 && blocoNota.position.x <= 755))) {

            //NOTAS CERTAS
                if([blocoNota.name isEqualToString:@"Dó"] || [blocoNota.name isEqualToString:@"Ré"] || [blocoNota.name isEqualToString:@"Mi"] || [blocoNota.name isEqualToString:@"Fá"] || [blocoNota.name isEqualToString:@"Sol"] || [blocoNota.name isEqualToString:@"Lá"] || [blocoNota.name isEqualToString:@"Si"]){
                    NSLog(@"Colidiu nota certa com tocatreco - %@", blocoNota.name);
                
                
                    //Remove os blocos da view
                    [blocoNota removeAllChildren];
                    [blocoNota removeFromParent];
                    
                    //Adiciona pontuação
                    self.pontuacaoJogadorAtual += 10;
                    self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
                    
                    [self sortearNota];
                    
                    //Aguarda alguns segundos até criar um novo
                    [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(criaBlocoNotaMusical) userInfo:nil repeats:NO];
                    [[self botaoCairNota] setAlpha: 1];
                    self.podeCair = YES;
        
                //NOTAS ERRADAS
                }else if([blocoNota.name isEqualToString:@"Dor"] || [blocoNota.name isEqualToString:@"Rir"] || [blocoNota.name isEqualToString:@"Mou"] || [blocoNota.name isEqualToString:@"Fê"] || [blocoNota.name isEqualToString:@"Sou"] || [blocoNota.name isEqualToString:@"Lú"] || [blocoNota.name isEqualToString:@"Sir"]){
                
                NSLog(@"Colidiu nota errada com tocatreco - %@", blocoNota.name);
                [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(gameOver) userInfo:nil repeats:NO];

                }
            }
//COLISAO NO CHÃO
        }else if((segundoCorpoFisico.categoryBitMask & pisoCategoria)!=0){
            
            NSLog(@"Pos %fx - %fy", blocoNota.position.x, blocoNota.position.y);
             if (blocoNota.position.y <= 600 && ((blocoNota.position.x <= 915) || (blocoNota.position.x >= 670))){
            
                //NOTAS CERTAS
                 if([blocoNota.name isEqualToString:@"Dó"] || [blocoNota.name isEqualToString:@"Ré"] || [blocoNota.name isEqualToString:@"Mi"] || [blocoNota.name isEqualToString:@"Fá"] || [blocoNota.name isEqualToString:@"Sol"] || [blocoNota.name isEqualToString:@"Lá"] || [blocoNota.name isEqualToString:@"Si"]){
                
                    NSLog(@"Colidiu com o chão nota certa - %@", blocoNota.name);
                    [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(gameOver) userInfo:nil repeats:NO];
            
                //NOTAS ERRADAS
                 }else if([blocoNota.name isEqualToString:@"Dor"] || [blocoNota.name isEqualToString:@"Rir"] || [blocoNota.name isEqualToString:@"Mou"] || [blocoNota.name isEqualToString:@"Fê"] || [blocoNota.name isEqualToString:@"Sou"] || [blocoNota.name isEqualToString:@"Lú"] || [blocoNota.name isEqualToString:@"Sir"]){
                
                    NSLog(@"Colidiu com o chão nota errada - %@", blocoNota.name);
                    
                        //Remove os blocos da view
                        [blocoNota removeAllChildren];
                        [blocoNota removeFromParent];
                    
                        //Adiciona pontuação
                        self.pontuacaoJogadorAtual += 10;
                        self.labelDePontuacao.text = [NSString stringWithFormat: @"%d", self.pontuacaoJogadorAtual];
                    
                        [self sortearNota];
                    
                        //Aguarda alguns segundos até criar um novo
                        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(criaBlocoNotaMusical) userInfo:nil repeats:NO];
                        [[self botaoCairNota] setAlpha: 1];
                        self.podeCair = YES;

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
    
    //Botão cair bloco
    if (([node.name isEqualToString:@"cairNota"]) && self.podeCair) {
        [self adionarFisicaAoBlocoMusical];
        [[self botaoCairNota] setAlpha: 0];
        self.podeCair = NO;
    }
    
}


////////////////////////////////////////////////// CRIAÇÃO DE AMBIENTE, PERSONAGENS E OUTROS COMPONENTES ////////////////////////////////////////////////////
//FUNDO
-(void)criaFundo{
    
    //Aloca, seta nome e tamanho do nó
    fundo = [[SKNode alloc]init];
    fundo.name = @"Fundo";
    fundo.position  = CGPointMake(512, 384);
    
    //Cria testura do fundo
    SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"fundoPapiro.png"];
    self.fundoPrincipal = [SKSpriteNode spriteNodeWithTexture: texturaFundoPrincipal size: CGSizeMake(1024, 768)];
    fundo.zPosition = -5;
    
    //Adiciona a textura ao nó, e o nó a cena
    [fundo addChild: self.fundoPrincipal];
    [self addChild: fundo];
}

//PISO
-(void)criaPiso{
    
    //Aloca, seta nome e tamanho do nó
    piso = [[SKNode alloc]init];
    piso.name = @"Piso";
    piso.position = CGPointMake(512, -60);
    
    //Cria testura do piso
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed: @"chao.png"];
    self.pisoPrincipal = [SKSpriteNode spriteNodeWithTexture:texturaPiso size: CGSizeMake(2400, 50)];
    
    //Cria o corpo físico do piso
    self.pisoPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.pisoPrincipal.size];
    self.pisoPrincipal.physicsBody.dynamic = NO;
    self.pisoPrincipal.physicsBody.affectedByGravity = NO;
    self.pisoPrincipal.physicsBody.allowsRotation = NO;
    self.pisoPrincipal.physicsBody.density = 0.6f;
    self.pisoPrincipal.physicsBody.restitution = 0;
    
    //Configuração colisão do corpo físico do piso
    self.pisoPrincipal.physicsBody.categoryBitMask = pisoCategoria;
    self.pisoPrincipal.physicsBody.contactTestBitMask = blocoNotaCorreta;
    
    //Adiciona a textura ao nó, e o nó a cena
    [piso addChild: self.pisoPrincipal];
    [self addChild: piso];
}

//GUINDASTE
-(void)criaGuindaste{
    
    //Aloca, seta nome e tamanho do nó
    guindaste = [[SKNode alloc]init];
    guindaste.name = @"Guindaste";
    guindaste.position = CGPointMake(512, 700);
    guindaste.zPosition = 1;
    
    //Cria testura do guindaste
    SKTexture *texturaGuindaste = [SKTexture textureWithImageNamed: @"ganchoGuindaste.jpg"];
    self.guindastePrincipal = [SKSpriteNode spriteNodeWithTexture: texturaGuindaste size: CGSizeMake(110, 110)];
    
    //Cria o corpo físico do guindaste
    guindaste.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(110, 110)];
    guindaste.physicsBody.dynamic = NO;
    guindaste.physicsBody.affectedByGravity = NO;
    guindaste.physicsBody.allowsRotation =NO;
    guindaste.physicsBody.density = 0.2f;
    guindaste.physicsBody.usesPreciseCollisionDetection = YES;
    guindaste.physicsBody.restitution = 0;
    
    [self acaoMoverDireitaEsquerda: guindaste :self.velocidadeGuindaste];
    
    [guindaste addChild: self.guindastePrincipal];
    [self addChild: guindaste];
}


//TOCATRECO
-(void)criaTocaTreco{
    
//CORPO FISICO PARA TOCATRECO
    //Aloca, seta nome e tamanho do nó
    corpoParaColisaoDoTocaTreco = [[SKNode alloc]init];
    corpoParaColisaoDoTocaTreco.name = @"CorpoTocaTreco";
    
    self.coluna1 = [[SKSpriteNode alloc] init];
    self.coluna1.color = [UIColor blackColor];
    self.coluna1.size = CGSizeMake(45, 220);
    self.coluna1.position = CGPointMake(351, 30);
    self.coluna1.zPosition = 3;

    self.coluna2 = [[SKSpriteNode alloc] init];
    self.coluna2.color = [UIColor blackColor];
    self.coluna2.size = CGSizeMake(45, 220);
    self.coluna2.position = CGPointMake(655, 30);
    self.coluna2.zPosition = 3;
    
    self.base = [[SKSpriteNode alloc] init];
    self.base.color = [UIColor redColor];
    self.base.size = CGSizeMake(260, 40);
    self.base.position = CGPointMake(503, 10);
    self.base.zPosition = 3;

    self.coluna1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.coluna1.size];
    self.coluna1.physicsBody.dynamic = NO;
    self.coluna2.physicsBody.categoryBitMask = coluna;
    self.coluna2.physicsBody.contactTestBitMask = blocoNotaCorreta;

    self.coluna2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.coluna2.size];
    self.coluna2.physicsBody.dynamic = NO;
    self.coluna2.physicsBody.categoryBitMask = coluna;
    self.coluna2.physicsBody.contactTestBitMask = blocoNotaCorreta;

    self.base.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.base.size];
    self.base.physicsBody.dynamic = NO;
    self.base.physicsBody.affectedByGravity = NO;
    self.base.physicsBody.allowsRotation = NO;
    self.base.physicsBody.density = 0.2f;
    self.base.physicsBody.usesPreciseCollisionDetection = YES;
    self.base.physicsBody.restitution = 0;
    self.base.physicsBody.categoryBitMask = tocaTrecoCategoria;
    self.base.physicsBody.contactTestBitMask = blocoNotaCorreta;
    
    [self addChild: _coluna1];
    [self addChild: _coluna2];
    [corpoParaColisaoDoTocaTreco addChild: _base];
    [self addChild: corpoParaColisaoDoTocaTreco];

    NSLog(@"COLUNA1 Pos %fx - %fy", _coluna1.position.x, _coluna1.position.y);
    NSLog(@"COLUNA2 Pos %fx - %fy", _coluna2.position.x, _coluna2.position.y);
    NSLog(@"BASE Pos %fx - %fy", _base.position.x, _base.position.y);
}


//BLOCO MUSICAL
-(void)criaBlocoNotaMusical{
    
    //Aloca, seta nome e tamanho do nó
    blocoNota = [[SKNode alloc]init];
    blocoNota.name = @"Nota";
    blocoNota.position = CGPointMake(512, 600);
    blocoNota.zPosition = 3;

        //Cria testura do guindaste
    SKTexture *texturaNota = [SKTexture textureWithImageNamed: @"doBloco.png"];
    self.blocoNotaPrincipal = [SKSpriteNode spriteNodeWithTexture: texturaNota size: CGSizeMake(120, 112)];
    self.blocoNotaPrincipal.zPosition = 3;
    
    [self acaoMoverDireitaEsquerda: blocoNota :self.velocidadeGuindaste];
    
    [blocoNota addChild: self.blocoNotaPrincipal];
    [self addChild: blocoNota];
}

-(void)sortearNota{
    //Sorteia o índice para a nota
    self.indiceNotaSorteada = arc4random() % 14;
        self.nomeDaNota.text = [NSString stringWithFormat:@"Nota: %@", [self.listaDeNotas objectAtIndex: self.indiceNotaSorteada]];
}

//ADICIONA FÍSICA AO BLOCO MUSICAL
-(void)adionarFisicaAoBlocoMusical{
    
    //Adiciona a nota e sua label o nome sorteado
    blocoNota.name = [self.listaDeNotas objectAtIndex: self.indiceNotaSorteada];
    NSLog(@"%@", blocoNota.name);
    
    //Cria o corpo físico do bloco
    self.blocoNotaPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: self.blocoNotaPrincipal.size];
    self.blocoNotaPrincipal.physicsBody.dynamic = YES;
    self.blocoNotaPrincipal.physicsBody.affectedByGravity = YES;
    self.blocoNotaPrincipal.physicsBody.allowsRotation = YES;
    self.blocoNotaPrincipal.physicsBody.density = 0.2f;
    self.blocoNotaPrincipal.physicsBody.usesPreciseCollisionDetection = YES;
    self.blocoNotaPrincipal.physicsBody.restitution = 0;
    
    /* Se a nota sorteada estiver entre as sete 1as, ela recebe a categoria de nota certa
     Do contrário será uma nota da categoria errada */
    self.blocoNotaPrincipal.physicsBody.categoryBitMask = blocoNotaCorreta;
    
    //Configura com quais categorias terá colisão
    self.blocoNotaPrincipal.physicsBody.contactTestBitMask = pisoCategoria | tocaTrecoCategoria | coluna;
    
    //Remove os nós dos pais e adiciona novamente com a física
    [blocoNota removeFromParent];
    [self.blocoNotaPrincipal removeFromParent];

    [blocoNota addChild: self.blocoNotaPrincipal];
    [self addChild: blocoNota];

}


/////////////////////////////////////////////////////// BOTÕES ////////////////////////////////////////////////////////

-(void)cairNota{
    
    self.botaoCairNota = [[SKSpriteNode alloc] init];
    self.botaoCairNota = [SKSpriteNode spriteNodeWithImageNamed:@"botaoLancar.png"];
    self.botaoCairNota.name = @"cairNota";
    self.botaoCairNota.position = CGPointMake(900, 100);
    self.botaoCairNota.size = CGSizeMake(100, 100);
    self.botaoCairNota.zPosition = 10;
    
    [self addChild: self.botaoCairNota];
}



/////////////////////////////////////////////////////// AÇÕES, ANIMAÇÕES E SPRITES ////////////////////////////////////////////////////////
//MOVIMENTO DIREITA ESQUERDA
-(void)acaoMoverDireitaEsquerda: (SKNode*)node :(int)duracao{
    
    //Antigos: 212 - 812
    SKAction *moverPraEsquerda = [SKAction moveTo: CGPointMake(112, node.position.y) duration: duracao];
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


@end
