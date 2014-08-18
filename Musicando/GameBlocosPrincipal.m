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
        
        //Inicia com velocidade padrão do guindaste
        self.velocidadeGuindaste = 1;
        
        //Inicia lista de notas e indice para sorteio
        self.listaDeNotas = [[NSArray alloc] initWithObjects: @"Dó", @"Ré", @"Mi", @"Fá", @"Sol", @"Lá", @"Si", @"Dor", @"Rir", @"Mou", @"Fê", @"Sou", @"Lú", @"Sir", nil];

        //Inicia primeiros nós
        [self carregarPrimeirosComponentes];
        
        [self sortearNota];
    }
    
    return self;
}


-(void)carregarPrimeirosComponentes{
    
    [self criaFundo];
    [self criaPiso];

    //[self criaGuindaste];
    [self criaTocaTreco];
    [self criaBlocoNotaMusical];

    [self addChild: [self criarBotaoCairBloco]];
    

//Configura as labels de pontuação
    self.stringDePontuacao = [[SKLabelNode alloc]init];
    self.stringDePontuacao.fontColor = [UIColor redColor];
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
    self.nomeDaNota.fontColor = [UIColor redColor];
    self.nomeDaNota.fontSize = 40.0f;
    self.nomeDaNota.position = CGPointMake(90, 720);
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

            //NOTAS CERTAS
            if([blocoNota.name isEqualToString:@"Dó"] || [blocoNota.name isEqualToString:@"Ré"] || [blocoNota.name isEqualToString:@"Mi"] || [blocoNota.name isEqualToString:@"Fá"] || [blocoNota.name isEqualToString:@"Sol"] || [blocoNota.name isEqualToString:@"Lá"] || [blocoNota.name isEqualToString:@"Si"]){
                NSLog(@"Colidiu nota certa com tocatreco - %@", blocoNota.name);
                
                
                if (blocoNota.position.y > corpoParaColisaoDoTocaTreco.position.y+50) {
                    //Remove os blocos da view
                    [blocoNota removeAllChildren];
                    [blocoNota removeFromParent];
                    
                    //Adiciona pontuação
                    self.pontuacaoJogadorAtual += 10;
                    self.labelDePontuacao.text = [NSString stringWithFormat: @"%i", self.pontuacaoJogadorAtual];
                    
                    [self sortearNota];
                    
                    //Aguarda alguns segundos até criar um novo
                    [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(criaBlocoNotaMusical) userInfo:nil repeats:NO];
                    [[self botaoCairNota] setAlpha: 1];
                }
                


            //NOTAS ERRADAS
            }else if([blocoNota.name isEqualToString:@"Dor"] || [blocoNota.name isEqualToString:@"Rir"] || [blocoNota.name isEqualToString:@"Mou"] || [blocoNota.name isEqualToString:@"Fê"] || [blocoNota.name isEqualToString:@"Sou"] || [blocoNota.name isEqualToString:@"Lú"] || [blocoNota.name isEqualToString:@"Sir"]){
                
                NSLog(@"Colidiu nota errada com tocatreco - %@", blocoNota.name);
                NSLog(@"Chama cena de GameOver!");

            }
//COLISAO NO CHÃO
        }else{
            
            if((segundoCorpoFisico.categoryBitMask & pisoCategoria)!=0){
            
                //NOTAS CERTAS
                }if([blocoNota.name isEqualToString:@"Dó"] || [blocoNota.name isEqualToString:@"Ré"] || [blocoNota.name isEqualToString:@"Mi"] || [blocoNota.name isEqualToString:@"Fá"] || [blocoNota.name isEqualToString:@"Sol"] || [blocoNota.name isEqualToString:@"Lá"] || [blocoNota.name isEqualToString:@"Si"]){
                
                    NSLog(@"Colidiu com o chão nota certa - %@", blocoNota.name);
                    
            
            //NOTAS ERRADAS
                }else if([blocoNota.name isEqualToString:@"Dor"] || [blocoNota.name isEqualToString:@"Rir"] || [blocoNota.name isEqualToString:@"Mou"] || [blocoNota.name isEqualToString:@"Fê"] || [blocoNota.name isEqualToString:@"Sou"] || [blocoNota.name isEqualToString:@"Lú"] || [blocoNota.name isEqualToString:@"Sir"]){
                
                    NSLog(@"Colidiu com o chão nota errada - %@", blocoNota.name);
                    NSLog(@"Chama cena de GameOver!");

                    if (blocoNota.position.y > piso.position.y+50) {

                        //Remove os blocos da view
                        [blocoNota removeAllChildren];
                        [blocoNota removeFromParent];
                    
                        //Adiciona pontuação
                        self.pontuacaoJogadorAtual += 10;
                        self.labelDePontuacao.text = [NSString stringWithFormat: @"%i", self.pontuacaoJogadorAtual];
                    
                        [self sortearNota];
                    
                        //Aguarda alguns segundos até criar um novo
                        [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(criaBlocoNotaMusical) userInfo:nil repeats:NO];
                        [[self botaoCairNota] setAlpha: 1];

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
    if ([node.name isEqualToString:@"cairNota"]) {
        [self adionarFisicaAoBlocoMusical];
        [[self botaoCairNota] setAlpha: 0];
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
    SKTexture *texturaFundoPrincipal = [SKTexture textureWithImageNamed: @"papelAntigo.jpg"];
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
    piso.position = CGPointMake(300, -60);
    
    //Cria testura do piso
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed: @"chao.png"];
    self.pisoPrincipal = [SKSpriteNode spriteNodeWithTexture:texturaPiso size: CGSizeMake(1200, 50)];
    
    //Cria o corpo físico do piso
    self.pisoPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(1200, 50)];
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
    corpoParaColisaoDoTocaTreco.position = CGPointMake(485, 50);
    corpoParaColisaoDoTocaTreco.zPosition = 3;
    
    //Cria o corpo do cone
    SKSpriteNode *imagemCorpoTocaTreco = [SKSpriteNode spriteNodeWithImageNamed: @"triangulo.png"];

    CGFloat offsetX = imagemCorpoTocaTreco.frame.size.width * imagemCorpoTocaTreco.anchorPoint.x;
    CGFloat offsetY = imagemCorpoTocaTreco.frame.size.height * imagemCorpoTocaTreco.anchorPoint.y;
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 164 - offsetX, 2 - offsetY);
    CGPathAddLineToPoint(path, NULL, 168 - offsetX, 68 - offsetY);
    CGPathAddLineToPoint(path, NULL, 93 - offsetX, 13 - offsetY);
    CGPathAddLineToPoint(path, NULL, 5 - offsetX, 73 - offsetY);
    CGPathAddLineToPoint(path, NULL, 3 - offsetX, 8 - offsetY);
    
    CGPathCloseSubpath(path);
    imagemCorpoTocaTreco.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath: path];
    
    imagemCorpoTocaTreco.physicsBody.dynamic = NO;
    imagemCorpoTocaTreco.physicsBody.affectedByGravity = NO;
    imagemCorpoTocaTreco.physicsBody.allowsRotation = NO;
    imagemCorpoTocaTreco.physicsBody.density = 0.2f;
    imagemCorpoTocaTreco.physicsBody.usesPreciseCollisionDetection = YES;
    imagemCorpoTocaTreco.physicsBody.restitution = 0;
    imagemCorpoTocaTreco.physicsBody.categoryBitMask = tocaTrecoCategoria;
    imagemCorpoTocaTreco.physicsBody.contactTestBitMask = pisoCategoria | blocoNotaCorreta;
    
    [corpoParaColisaoDoTocaTreco addChild: imagemCorpoTocaTreco];
    [self addChild: corpoParaColisaoDoTocaTreco];
    
//TOCATRECO
    //Aloca, seta nome e tamanho do nó
    tocaTreco = [[SKNode alloc]init];
    tocaTreco.name = @"TocaTreco";
    tocaTreco.position = CGPointMake(530, 100);
    tocaTreco.zPosition = 10;
    
    //Cria testura do guindaste
    SKTexture *texturaTocaTreco = [SKTexture textureWithImageNamed: @"bocaDoTocaTreco.png"];
    self.tocaTrecoPrincipal = [SKSpriteNode spriteNodeWithTexture: texturaTocaTreco size: CGSizeMake(840, 200)];
    
    [tocaTreco addChild: self.tocaTrecoPrincipal];
    [self addChild: tocaTreco];

}


//BLOCO MUSICAL
-(void)criaBlocoNotaMusical{
    
    //Aloca, seta nome e tamanho do nó
    blocoNota = [[SKNode alloc]init];
    blocoNota.name = @"Nota";
    blocoNota.position = CGPointMake(512, 700);
    blocoNota.zPosition = 3;

        //Cria testura do guindaste
    SKTexture *texturaNota = [SKTexture textureWithImageNamed: @"siBloco.png"];
    self.blocoNotaPrincipal = [SKSpriteNode spriteNodeWithTexture: texturaNota size: CGSizeMake(100, 100)];
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
    self.blocoNotaPrincipal.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize: CGSizeMake(120, 122)];
    self.blocoNotaPrincipal.physicsBody.dynamic = YES;
    self.blocoNotaPrincipal.physicsBody.affectedByGravity = YES;
    self.blocoNotaPrincipal.physicsBody.allowsRotation = YES;
    self.blocoNotaPrincipal.physicsBody.density = 0.2f;
    self.blocoNotaPrincipal.physicsBody.usesPreciseCollisionDetection = YES;
    self.blocoNotaPrincipal.physicsBody.restitution = 0;
    
    /* Se a nota sorteada estiver entre as sete 1as, ela recebe a categoria de nota certa
     Do contrário será uma nota da categoria errada */
    if (self.indiceNotaSorteada < 7)
        self.blocoNotaPrincipal.physicsBody.categoryBitMask = blocoNotaCorreta;
    else
        self.blocoNotaPrincipal.physicsBody.categoryBitMask = blocoNotaCorreta;
    
    //Configura com quais categorias terá colisão
    self.blocoNotaPrincipal.physicsBody.contactTestBitMask = pisoCategoria | tocaTrecoCategoria;
    
    
    //Remove os nós dos pais e adiciona novamente com a física
    [blocoNota removeFromParent];
    [self.blocoNotaPrincipal removeFromParent];

    [blocoNota addChild: self.blocoNotaPrincipal];
    [self addChild: blocoNota];

}


/////////////////////////////////////////////////////// BOTÕES ////////////////////////////////////////////////////////

- (SKSpriteNode *)criarBotaoCairBloco{
    
    //Cria e seta configurações do botão
    _botaoCairNota = [SKSpriteNode spriteNodeWithImageNamed:@"buttonMagic.png"];
    _botaoCairNota.position = CGPointMake(160,330);
    _botaoCairNota.size = CGSizeMake(50,50);
    _botaoCairNota.name = @"cairNota";
    _botaoCairNota.zPosition = +5.0;
    
    return _botaoCairNota;
}



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


@end
