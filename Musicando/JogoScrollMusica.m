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


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        self.physicsWorld.contactDelegate = self;
        self.physicsWorld.gravity = CGVectorMake(0,GRAVIDADEMUNDO );

        
        PBParallaxBackgroundDirection direction = kPBParallaxBackgroundDirectionRight;
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

   
        [self criaPiso];
        [self criaMascote];

        
    }
    
    return self;
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
    self.man = [SKSpriteNode spriteNodeWithTexture:texturaPiso2 size:CGSizeMake(200,50)];
    self.man.name = @"HumanWhite";
    [self.man setSize:CGSizeMake(100,150)];
    self.man.position = CGPointMake(100, 400);
    self.man.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.man.size.width/2];
    self.man.physicsBody.dynamic = YES;
    self.man.physicsBody.affectedByGravity =YES;
    self.man.physicsBody.allowsRotation =NO;
    self.man.physicsBody.density = 0.2f;
    self.man.physicsBody.usesPreciseCollisionDetection = YES;
    self.man.physicsBody.restitution =1;
    self.man.physicsBody.categoryBitMask = mascoteCategory;
    self.man.physicsBody.contactTestBitMask = pisoCategory ;

    [self addChild:self.man];
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
    //NSLog(@"v = %f",self.man.position.y);
    //[self centerOnNode:self.man];
    //[self centerOnCameraNamed:@"HumanWhite"];
    
//    self.parallaxBackground.position = CGPointMake(-(self.man.position.x-(self.size.width/2)), -(self.man.position.y-(self.size.height/2)));
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
   
    [self.parallaxBackground reverseMovementDirection];
//    if ([node.name isEqualToString:@"flyHeroe"]) {
//        
//        if(self.tempoPassaroBonus >1){
//            self.verfificaBotaoFly = true;
//            buttonMagic.hidden = NO;
//            buttonDownNode.hidden = YES;
//            buttonUpNode.hidden = YES;
//            [self heroFly];
//            self.man.physicsBody.density = 0.3f;
//            self.man.physicsBody.velocity = CGVectorMake(0, 0);
//            [self.man.physicsBody applyForce:CGVectorMake(0, 3000)];
//        }
//        
//    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    
    
    [self.parallaxBackground update:currentTime];
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
            //[self.man.physicsBody applyImpulse:CGVectorMake(10,0)];
        }
    }
    
}


@end









