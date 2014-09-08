//
//  JogoScrollMusica.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 15/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "JogoScrollMusica.h"


#define GRAVIDADEMUNDO -10


@implementation JogoScrollMusica


- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0,GRAVIDADEMUNDO );
        
        
        NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"musicaJogoMusica" ofType:@"mp3"]];
        [[ExercicioPlayer sharedManager]playAudio:musicFile:-1];
        
        PBParallaxBackgroundDirection direction = kPBParallaxBackgroundDirectionLeft;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.direction = direction;
        NSArray * imageNames;
        
        if (direction == kPBParallaxBackgroundDirectionLeft || direction == kPBParallaxBackgroundDirectionRight)
            imageNames= @[@"pForegroundHorizontal", @"pMiddleHorizontal", @"pBackgroundHorizontal"];
        else imageNames= @[@"pForegroundVertical", @"pMiddleVertical", @"pBackgroundVertical"];
        PBParallaxScrolling * parallax = [[PBParallaxScrolling alloc] initWithBackgrounds:imageNames size:size direction:direction fastestSpeed:5.0 andSpeedDecrease:kPBParallaxBackgroundDefaultSpeedDifferential];
        self.parallaxBackground = parallax;
        [self addChild:parallax];

        
        self.velocidadeMonstro = 12;
        self.distanciaPercorrida = 0;
        self.sorteaMonstro = 0;
        self.AuxdistanciaPercorrida =0;
        self.contadorPontos = 0;
        
        self.textoDistancia = [[SKLabelNode alloc]init];
        self.textoDistancia.fontColor = [UIColor blackColor];
        self.textoDistancia.fontSize = 25.0f;
        self.textoDistancia.position = CGPointMake(500,670);
        self.textoDistancia.zPosition = 2;
        self.textoDistancia.text = @"0";
        self.textoDistancia.fontName = @"Marker Felt Thin";
        [self addChild:self.textoDistancia];
        
        SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"casaMusica.png"];
        self.iconeDistancia = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(50,50)];
        self.iconeDistancia.name = @"Morte";
        self.iconeDistancia.position = CGPointMake(450,680);
        [self addChild:self.iconeDistancia];
        
        [self addChild:[self botaoHomenRetorna]];
        [self criaPiso];
        [self criaMascote];

        
    }
    
    return self;
}



-(void)criaMorte {
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"ruido.png"];
    self.morte = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(150,150)];
    self.morte.name = @"Morte";
    self.morte.position = CGPointMake(800,100);
    self.morte.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100,100)];
    self.morte.physicsBody.dynamic = YES;
    self.morte.physicsBody.affectedByGravity =NO;
    self.morte.physicsBody.allowsRotation =NO;
    self.morte.physicsBody.density = 0.1f;
    self.morte.physicsBody.restitution =0.0;
    self.morte.physicsBody.usesPreciseCollisionDetection = YES;
    self.morte.physicsBody.categoryBitMask = monstroNivel1Category;
    self.morte.physicsBody.contactTestBitMask = mascoteCategory;
    self.morte.physicsBody.velocity = CGVectorMake(0,0);
    
    SKAction *acaoMover = [SKAction moveTo:CGPointMake(-800, self.morte.position.y) duration:self.velocidadeMonstro];
    SKAction *acaoRemover = [SKAction removeFromParent];
    [self.morte runAction:[SKAction sequence:@[acaoMover,acaoRemover]]];
    

    [self addChild:self.morte];
    
}

-(void)criaDragao {
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"ruido.png"];
    self.dragao = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(150,150)];
    self.dragao.name = @"Dragao";
    self.dragao.position = CGPointMake(800,300);
    self.dragao.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100,100)];
    self.dragao.physicsBody.dynamic = YES;
    self.dragao.physicsBody.affectedByGravity =NO;
    self.dragao.physicsBody.allowsRotation =NO;
    self.dragao.physicsBody.density = 0.1f;
    self.dragao.physicsBody.restitution =0.0;
    self.dragao.physicsBody.usesPreciseCollisionDetection = YES;
    self.dragao.physicsBody.categoryBitMask = monstroNivel2Category;
    self.dragao.physicsBody.contactTestBitMask = mascoteCategory;
    

    SKAction *acaoMover = [SKAction moveTo:CGPointMake(-800, self.dragao.position.y) duration:self.velocidadeMonstro];
    SKAction *acaoRemover = [SKAction removeFromParent];
    [self.dragao runAction:[SKAction sequence:@[acaoMover,acaoRemover]]];
    

    [self addChild:self.dragao];
    
}

-(void)criaMaicon {
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"ruido.png"];
    self.maicon = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(150,150)];
    self.maicon.name = @"Maicon";
    self.maicon.position = CGPointMake(800,500);
    self.maicon.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100,100)];
    self.maicon.physicsBody.dynamic = YES;
    self.maicon.physicsBody.affectedByGravity =NO;
    self.maicon.physicsBody.allowsRotation =NO;
    self.maicon.physicsBody.density = 0.1f;
    self.maicon.physicsBody.usesPreciseCollisionDetection = YES;
    self.maicon.physicsBody.categoryBitMask = monstroNivel3Category;
    self.maicon.physicsBody.contactTestBitMask = mascoteCategory;
    self.maicon.physicsBody.velocity = CGVectorMake(0,0);
    
    
    SKAction *acaoMover = [SKAction moveTo:CGPointMake(-800, self.maicon.position.y) duration:self.velocidadeMonstro];
    SKAction *acaoRemover = [SKAction removeFromParent];
    [self.maicon runAction:[SKAction sequence:@[acaoMover,acaoRemover]]];
    
    
    [self addChild:self.maicon];
    
}

-(void)criaGargula {
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"ruido.png"];
    self.gargula = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(150,150)];
    self.gargula.name = @"Gargula";
    self.gargula.position = CGPointMake(800,700);
    self.gargula.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100,100)];
    self.gargula.physicsBody.dynamic = YES;
    self.gargula.physicsBody.affectedByGravity =NO;
    self.gargula.physicsBody.allowsRotation =NO;
    self.gargula.physicsBody.density = 0.1f;
    self.gargula.physicsBody.restitution =0.2;
    self.gargula.physicsBody.usesPreciseCollisionDetection = YES;
    self.gargula.physicsBody.categoryBitMask = monstroNivel4Category;
    self.gargula.physicsBody.contactTestBitMask = mascoteCategory;
    self.gargula.physicsBody.velocity = CGVectorMake(0,0);
    
    SKAction *acaoMover = [SKAction moveTo:CGPointMake(-800, self.gargula.position.y) duration:self.velocidadeMonstro];
    SKAction *acaoRemover = [SKAction removeFromParent];
    [self.gargula runAction:[SKAction sequence:@[acaoMover,acaoRemover]]];
    
    [self addChild:self.gargula];
    
}

-(void)criaCasa {
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"casaMusica.png"];
    self.casa = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(400,400)];
    self.casa.name = @"Casa";
    self.casa.position = CGPointMake(1100,225);
    self.casa.zPosition = -1.0;
    
    SKAction *acaoMover = [SKAction moveTo:CGPointMake(-800, self.casa.position.y) duration:6];
    SKAction *acaoRemover = [SKAction removeFromParent];
    [self.casa runAction:[SKAction sequence:@[acaoMover,acaoRemover]]];
    [self addChild:self.casa];
    
    self.contadorPontos += 1;
    self.textoDistancia.text = [NSString stringWithFormat:@"%d", self.contadorPontos];
   
    
}

-(void)criaPiso{
    
    SKTexture *texturaPiso = [SKTexture textureWithImageNamed:@"pisoPedra.png"];
    self.piso = [SKSpriteNode spriteNodeWithTexture:texturaPiso size:CGSizeMake(2300,50)];
    self.piso.position = CGPointMake(0,0);
    self.piso.name = @"Piso";
    self.piso.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1900,100)];
    self.piso.physicsBody.dynamic = NO;
    self.piso.physicsBody.affectedByGravity =NO;
    self.piso.physicsBody.allowsRotation =NO;
    self.piso.physicsBody.density = 0.6f;
    self.piso.physicsBody.restitution =0;
    self.piso.physicsBody.categoryBitMask = pisoCategory;
    self.piso.physicsBody.contactTestBitMask = mascoteCategory;
    
    SKAction *moveToLeftFloor = [SKAction moveTo:CGPointMake(-100,self.piso.position.y) duration:1];
    SKAction *moveToRightFloor = [SKAction moveTo:CGPointMake(300,self.piso.position.y) duration:0];
    SKAction *sequenceFloor = [SKAction sequence:@[moveToLeftFloor, moveToRightFloor]];
    [self.piso runAction:[SKAction repeatActionForever:sequenceFloor]];
    [self addChild:self.piso];
    

}


-(void)criaMascote{
    
    SKTexture *texturaPiso2 = [SKTexture textureWithImageNamed:@"mascote.png"];
    self.man = [SKSpriteNode spriteNodeWithTexture:texturaPiso2 size:CGSizeMake(250,50)];
    self.man.name = @"HumanWhite";
    [self.man setSize:CGSizeMake(100,150)];
    self.man.position = CGPointMake(250, 700);
    self.man.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.man.size.width/2];
    self.man.physicsBody.dynamic = YES;
    self.man.physicsBody.affectedByGravity =YES;
    self.man.physicsBody.allowsRotation =NO;
    self.man.physicsBody.density = 0.1f;
    self.man.physicsBody.usesPreciseCollisionDetection = YES;
    self.man.physicsBody.restitution =0;
    self.man.physicsBody.categoryBitMask = mascoteCategory;
    self.man.physicsBody.contactTestBitMask = pisoCategory ;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"animacaoNotasMascote" ofType:@"sks"];
    self.particulaNotaMascote = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    self.particulaNotaMascote.position = CGPointMake(-130, 0);

    [self.man addChild:self.particulaNotaMascote];
    

    [self addChild:self.man];
}

- (SKSpriteNode *)botaoHomenRetorna{
   

    self.btnPula = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(1024,768)];
    self.btnPula.position = CGPointMake(520,380);
    self.btnPula.name = @"pulaMascote";//how the node is identified later
    self.btnPula.zPosition = +5.0;
    return self.btnPula;
}

//-(void)centerOnNode:(SKNode*)node {
//    CGPoint cameraPositionInScene = [node.scene convertPoint:node.position fromNode:node.parent];
//    cameraPositionInScene.x = 0;
//    node.parent.position = CGPointMake(node.parent.position.x - cameraPositionInScene.x, node.parent.position.y - cameraPositionInScene.y);
//}

//- (void)centerOnCameraNamed:(NSString*)cameraName
//{
//    SKNode* world = self.worldNode;
//    SKNode* camera = [world childNodeWithName:cameraName];
//    CGPoint cameraPositionInScene = [camera.scene convertPoint:camera.position fromNode:world];
//    world.position = CGPointMake(world.position.x - cameraPositionInScene.x, world.position.y - cameraPositionInScene.y);
//}

-(void)didSimulatePhysics{
 
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
//    [self.parallaxBackground reverseMovementDirection];

    if ([node.name isEqualToString:@"pulaMascote"]) {
        [self.man.physicsBody applyForce:CGVectorMake(0, 1000)];
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    [self.parallaxBackground update:currentTime];
    
    self.AuxdistanciaPercorrida += 1;
    
    
    if(self.AuxdistanciaPercorrida % 40 == 0 ){
        self.distanciaPercorrida += 1;
        
        if(self.distanciaPercorrida % 8 == 0){
            
        self.sorteaMonstro = arc4random()%5;
                
                switch (self.sorteaMonstro) {
                    case 0:
                        [self criaMorte];
                        [self criaDragao];
                        [self criaGargula];
                        break;
                    case 1:
                        [self criaMorte];
                        [self criaDragao];
                        [self criaMaicon];
                        break;
                    case 2:
                        [self criaMorte];
                        [self criaDragao];
                        [self criaMaicon];
                        break;
                        
                    case 3:
                        [self criaGargula];
                        [self criaDragao];
                        [self criaMaicon];
                        break;
                    case 4:
                        [self criaGargula];
                        [self criaMorte];
                        [self criaMaicon];
                        break;
                }
            
        }
        
        if(self.distanciaPercorrida % 16 == 0){
            [self criaCasa];
        }
        
        if(self.contadorPontos % 8 == 0){
            if(self.velocidadeMonstro > 3.5)self.velocidadeMonstro -= 0.5;
        }
        
    }
    
   
}

-(void)pausaJogo{
    self.scene.view.paused = YES;
}

-(void)gameOver{
    [[GameOverViewController sharedManager]gameOverParaUmaCena].view.hidden = NO;
    [self pausaJogo];
   [[ExercicioPlayer sharedManager]stopAudio];
}

-(void)didBeginContact:(SKPhysicsContact *)contact {
    
    SKPhysicsBody *firstBody;
    SKPhysicsBody *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    if ((firstBody.categoryBitMask & mascoteCategory) !=0) {
        if((secondBody.categoryBitMask & pisoCategory)!=0){
        }else if((secondBody.categoryBitMask & monstroNivel1Category)!=0){
            [self gameOver];
        }else if((secondBody.categoryBitMask & monstroNivel2Category)!=0){
            [self gameOver];
        }else if((secondBody.categoryBitMask & monstroNivel3Category)!=0){
            [self gameOver];
        }else if((secondBody.categoryBitMask & monstroNivel4Category)!=0){
            [self gameOver];
        }
    }
    
}


@end









