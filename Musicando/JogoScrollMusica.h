//
//  JogoScrollMusica.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 15/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "PBParallaxScrolling.h"

static const UInt32 mascoteCategory = 0x1 << 0;
static const UInt32 pisoCategory = 0x1 << 2;

@interface JogoScrollMusica : SKScene <SKPhysicsContactDelegate>{
   
}

@property (nonatomic) PBParallaxBackgroundDirection direction;
@property (nonatomic, strong) PBParallaxScrolling * parallaxBackground;
@property SKSpriteNode *man;
@property SKSpriteNode *piso;

-(id)initWithSize:(CGSize)size andDirection: (PBParallaxBackgroundDirection) direction;


@end
