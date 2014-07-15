//
//  EfeitoImagem.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoImagem.h"

@implementation EfeitoImagem

//Singleton
+(EfeitoImagem*)sharedManager{
    static EfeitoImagem *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}


-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//////////////////////////// Metodos Add Gesture  /////////////////////////////

-(void)addGesturePainImagem:(UIImageView*)img{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    img.userInteractionEnabled = YES;
    [img addGestureRecognizer:panRecognizer];
    img.layer.zPosition = -10;
}

-(void)addGesturePainImagens:(NSMutableArray*)listaImangesColisao{
    for(UIImageView *img in listaImangesColisao){
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        img.userInteractionEnabled = YES;
        [img addGestureRecognizer:panRecognizer];
        img.layer.zPosition = -10;
    }
}

- (void)pan:(UIPanGestureRecognizer *)gesture {
    
    static CGPoint originalCenter;
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        originalCenter = gesture.view.center;
        [self pauseLayer:gesture.view.layer];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translate = [gesture translationInView:gesture.view.superview];
        gesture.view.center = CGPointMake(originalCenter.x + translate.x, originalCenter.y + translate.y);
    }
    else if (gesture.state == UIGestureRecognizerStateEnded ||
             gesture.state == UIGestureRecognizerStateFailed ||
             gesture.state == UIGestureRecognizerStateCancelled)
    {
        [self resumeLayer:gesture.view.layer];
    }
    
}

-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

/////////////////////////// COLISAO ///////////////////////////////

//-(void) checkCollision:(NSTimer *) theTimer{
//    CGRect pos = CGRectMake(0, 0, 0, 0);
//
//    for(UIImageView *img in self.listaImangesColisao){
//        id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
//        id presentationLayer2 = img.layer.presentationLayer;
//
//        BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
//
//        if (nowIntersecting){
//            if([img isEqual:self.imgFitaGalo]){
//                [self btnAnimal];
//                self.imgFitaGalo.hidden = true;
//                self.imgFitaGalo.frame = pos;
//
//            }
//            if([img isEqual:self.imgFitaCarro]){
//                [self btnCarro];
//                self.imgFitaCarro.hidden = true;
//                self.imgFitaCarro.frame = pos;
//
//            }
//            if([img isEqual:self.imgFitaFuracao]){
//                [self btnVento];
//                self.imgFitaFuracao.hidden = true;
//                self.imgFitaFuracao.frame = pos;
//
//            }
//
//        }
//    }
//
//}



@end
